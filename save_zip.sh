#!/bin/sh

. config

ZipName="${BackupsPath}$(date +%Y).$(date +%m).$(date +%d)-$EntityName-backup".zip

# Check if ${BackupsPath} exists
cd $BackupsPath || { exit 1; }

# Check if ${SourcePath} exists
cd $SourcePath || { exit 1; }

echo "[+] Zip folder ${SourcePath}"
zip -9 -y -r -q $ZipName ./* -x "${Exclude[@]}"

# Count backups
BackupsNum=$(find $BackupsPath -name "*-$EntityName-backup.zip" | wc -l)

# Remove the oldest backup
if [[ $BackupsNum -gt $MaxBackups ]];
 then
    OldestBackupRelative=$(ls -t $BackupsPath | grep "-$EntityName-backup.zip" | tail -1)
    OldestBackup="$BackupsPath$OldestBackupRelative"
    echo "[+] Remove $OldestBackup"
    rm $OldestBackup
fi

echo "[+] Done"
