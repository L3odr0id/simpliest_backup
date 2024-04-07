#!/bin/sh

# https://stackoverflow.com/a/4774063/15776812
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "[+] Create service file"
# https://gist.github.com/hkoba/e05c91ebdd4e2ffd1d79e78e76cf1ff5
ServicePath=/etc/systemd/user/sched_backup.service
rm -f $ServicePath
touch $ServicePath
echo "[Unit]
Description=Scheduled Backup

[Service]
Type=oneshot
WorkingDirectory=${SCRIPTPATH}/
ExecStart=/bin/bash ${SCRIPTPATH}/save_zip.sh" > $ServicePath

TimerPath=/etc/systemd/user/sched_backup.timer
rm -f $TimerPath
touch $TimerPath
echo "[Unit]
Description=Backup Scheduling.

[Timer]
OnCalendar=*-*-* 02:28:00

[Install]
WantedBy=timers.target" > $TimerPath # https://discussion.fedoraproject.org/t/systemctl-user-enable-unit-timer-does-not-start-after-reboot/73504/2

echo "[+] Start systemd timer"
systemctl --user start sched_backup.timer
systemctl --user enable sched_backup.timer
