# The simpliest backup
These utilities will help you to zip some folder every night and keep a specified number of archives.

## How to use
1. `git clone https://github.com/L3odr0id/simpliest_backup.git`
2. Set required absolute paths in the `config` file
3. Run `bash save_zip.sh` to chek if the paths exist (and run the backup once)
4. Run `sudo bash start_systemd_timer.sh` to schedule the `systemd` timer to run the backup at 02:28 AM once a day

P.S. Check if timer is actually running using `systemctl --user list-timers`
