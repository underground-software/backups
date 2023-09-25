#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TIMESTAMP=$(date +%s)
PREFIX='/mnt/telomerase'
ssh root@dev-01.kdlp.underground.software $PREFIX/backups/do_local_backup.sh "$TIMESTAMP"
scp root@dev-01.kdlp.underground.software:$PREFIX/backups/kdlp-prod-backup.$TIMESTAMP.tar.gz $SCRIPT_DIR
