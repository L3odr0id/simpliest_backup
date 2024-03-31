#!/bin/sh

# https://stackoverflow.com/a/4774063/15776812
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "[+] Create service file"
# Thanks to https://gist.github.com/hkoba/e05c91ebdd4e2ffd1d79e78e76cf1ff5
rm -f sched_backup.service
touch sched_backup.service

echo "[Unit]
Description=Scheduled Backup

[Service]
Type=simple
ExecStart=${SCRIPTPATH}/save_zip.sh" > sched_backup.service

echo "[+] Start systemd timer"
sudo systemctl start sched_backup.timer
sudo systemctl enable sched_backup.timer
