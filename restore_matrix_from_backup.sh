#!/bin/bash

PREFIX='/var/orbit'
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TIMESTAMP=$(date +%s)

PS4="-|"
set -e -x

if [ -z "${1}" ]; then
	echo "error: backup archive filename argument required"
	exit 1
fi
FILENAME=`basename $1`

die() { echo "error: $1" ; exit 1 ; }

echo "KDLP ORBIT RESTORE FROM BACKUP $FILENAME"

BACKUP="$PREFIX/backups/$FILENAME"
test -f $BACKUP || die "no such backup '$BACKUP'"

mkdir restore_matrix.$TIMESTAMP
cd restore_matrix.$TIMESTAMP
cp $BACKUP .
tar --xattrs --xattrs-include='*' -pxf `basename $BACKUP`
cd var/orbit/backups


echo " Restore matrix server from both of $(ls | grep matrix)"
rm -rf /etc/synapse
ls
cp --preserve=xattr -ar etc_synapse*/synapse /etc/

rm -rf /var/lib/synapse
cp --preserve=xattr -ar var_lib_synapse*/synapse /var/lib
