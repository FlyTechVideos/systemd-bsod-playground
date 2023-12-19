#!/bin/bash

FILE=${1:-"bsod.txt"}

sudo journalctl --user --flush --rotate --vacuum-time=1s
sudo systemd-cat -p emerg echo "$(printf %b '\e[41m' '\e[8]' '\e[H\e[J')$(cat $FILE)"
sudo /usr/lib/systemd/systemd-bsod
