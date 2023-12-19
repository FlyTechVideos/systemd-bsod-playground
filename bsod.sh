#!/bin/bash

TEXT=${1:-"Unknown Error"}

sudo journalctl --user --flush --rotate --vacuum-time=1s
sudo systemd-cat -p emerg echo $TEXT
sudo /usr/lib/systemd/systemd-bsod