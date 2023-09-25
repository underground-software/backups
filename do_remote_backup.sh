#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TIMESTAMP=$(date +%s)
PREFIX='/mnt/telomerase'
REMOTE='dev-01.kdlp.underground.software'
ssh root@$REMOTE $PREFIX/backups/do_local_backup.sh "$TIMESTAMP"
scp root@$REMOTE:$PREFIX/backups/kdlp-prod-backup.$TIMESTAMP.tar.gz \
	$SCRIPT_DIR/kdlp-$REMOTE-backup.$TIMESTAMP.tar.gz
