#!/bin/bash

echo "KDLP ORBIT LOCAL DATA BACKUP SCRIPT"

echo "[1]: back up users.db from venus"

cp /mnt/telomerase/cano.py/venus/users.db /mnt/telomerase/backups/users.db.$(date +%s)
