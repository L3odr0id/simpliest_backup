#!/bin/sh

. config

ZipName="${BackupsPath}$(date +%Y).$(date +%m).$(date +%d).$(date +%M).$(date +%S)-$EntityName-backup".zip

# Check if ${BackupsPath} exists
cd $BackupsPath || { exit 1; }

# Check if ${ServerPath} exists
cd $ServerPath || { exit 1; }

echo "[+] Zip folder ${ServerPath}"
zip -9 -y -r -q $ZipName ./* -x "dynmap/*" "hs_err_pid*.log" "replay_pid*.log" "bluemap/*"

# Count backups
BackupsNum=$(find $BackupsPath -name "*-$EntityName-backup.zip" | wc -l)

# Remove the oldest backup
if [[ $BackupsNum -gt $MaxBackups ]];
 then
    OldestBackupRelative=$(ls -t $BackupsPath | grep "-$EntityName-backup.zip" | tail -1)
    OldersBackup="$BackupsPath$OldestBackupRelative"
    echo "[+] Remove $OldersBackup"
    rm $OldersBackup
fi

echo "[+] Done"
