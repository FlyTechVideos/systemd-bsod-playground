#!/bin/bash

FILE=${1:-"bsod.txt"}

call_bsod() {
        sudo journalctl --user --flush --rotate --vacuum-time=1s
        sudo systemd-cat -p emerg echo "$(printf %b '\e[41m' '\e[8]' '\e[H\e[J')$(cat $FILE | sed -E "s/[0-9]+/$1/g")"
        sudo /usr/lib/systemd/systemd-bsod &
        sleep 2
}

for ((i = 0; i <= 100; i += 10)); do
        call_bsod $i
done

sudo poweroff