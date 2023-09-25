#!/bin/bash

echo "KDLP ORBIT LOCAL DATA BACKUP SCRIPT"

echo "[1]: back up users.db from venus"

cp /mnt/telomerase/cano.py/venus/users.db /mnt/telomerase/backups/users.db.$(date +%s)

echo "[2]: back up grades.db from mercury"

cp /mnt/telomerase/cano.py/mercury/grades.db /mnt/telomerase/backups/grades.db.$(date +%s)

echo "[3]: back up email_data"

DEST=/mnt/telomerase/backups/email_data.$(date +%s)
mkdir -p $DEST
cp -r /mnt/telomerase/email_data $DEST
