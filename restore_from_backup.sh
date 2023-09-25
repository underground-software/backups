#!/bin/bash

PREFIX='/var/orbit'
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

PS4="-|"
set -e -x

if [ -z "${1}" ]; then
	echo "error: backup archive filename argument required"
	exit 1
fi

FILENAME=$1

die() { echo "error: $1" ; exit 1 ; }

echo "KDLP ORBIT RESTORE FROM BACKUP $FILENAME"

BACKUP="$PREFIX/backups/$FILENAME"
test -f $BACKUP || die "no such backup '$BACKUP'"

TMP=$(mktemp -d)
cd $TMP
cp $BACKUP .
tar xf $BACKUP
ls
echo $TMP

echo "[1] Restore grades.db from $(ls grades*)"
cp grades.db* /var/orbit/cano.py/mercury/grades.db

echo "[2] Restore grades.db from $(ls grades*)"
cp users.db* /var/orbit/cano.py/venus/users.db

echo "[3] Restore email_data from $(ls | grep email_data)"
cp -r email_data*/email_data /var/orbit/
