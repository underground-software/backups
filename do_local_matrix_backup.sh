#!/bin/bash

PREFIX='/var/orbit'
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TIMESTAMP=${1:-$(date +%s)}

echo "KDLP ORBIT LOCAL MATRIX-SYNAPSE INSTANCE BACKUP SCRIPT @ $TIMESTAMP"

echo "[1]: back up /var/lib/matrix"

DEST=$PREFIX/backups/var_lib_synapse.$TIMESTAMP
mkdir -p $DEST
cp --preserve=xattr -ar /var/lib/synapse $DEST

echo "[2]: back up /etc/synapse"

DEST=$PREFIX/backups/etc_synapse.$TIMESTAMP
mkdir -p $DEST
cp --preserve=xattr -ar /etc/synapse $DEST

echo "[3]: output archive kdlp-prod-matrix-backup.$TIMESTAMP.tar.gz"
cd $SCRIPT_DIR
tar --xattrs --xattrs-include='*' -pcf kdlp-prod-matrix-backup.$TIMESTAMP.tar.gz $PREFIX/backups/etc_synapse.$TIMESTAMP $PREFIX/backups/var_lib_synapse.$TIMESTAMP
