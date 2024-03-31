# Simpliest folder backup
These utilities will allow you to backup some folder every night and save a specified number of archives.

## How to use
1. git clone 
2. Set absolute paths to the `config` file
3. Run `sh save_zip.sh` to chek if the paths exist (and run the backup once)
4. Run `sh start_systemd_timer.sh` to schedule the `systemd` timer to run the backup at 02:28 AM every day
