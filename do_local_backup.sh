#!/bin/bash


TIMESTAMP=$(date +%s)

echo "KDLP ORBIT LOCAL DATA BACKUP SCRIPT @ $TIMESTAMP"

echo "[1]: back up users.db from venus"

cp /mnt/telomerase/cano.py/venus/users.db /mnt/telomerase/backups/users.db.$TIMESTAMP

echo "[2]: back up grades.db from mercury"

cp /mnt/telomerase/cano.py/mercury/grades.db /mnt/telomerase/backups/grades.db.$TIMESTAMP

echo "[3]: back up email_data"

DEST=/mnt/telomerase/backups/email_data.$TIMESTAMP
mkdir -p $DEST
cp -r /mnt/telomerase/email_data $DEST

echo "[4]: output archive kdlp-prod-backup.$TIMESTAMP.tar.gz"
tar cf kdlp-prod-backup.$TIMESTAMP.tar.gz users.db.$TIMESTAMP grades.db.$TIMESTAMP email_data.$TIMESTAMP
