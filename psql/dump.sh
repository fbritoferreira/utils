#!/bin/bash
srcdbhost=$1
srcdbuser=$2
srcdbname=$2
srcdbpass=$3

echo "[INFO] Started..."
echo "[INFO] Setting up authentication for $1..."
echo "$srcdbhost:5432:$srcdbname:$srcdbuser:$srcdbpass" > ./pgpass_run
chmod 0600 ./pgpass_run
export PGPASSFILE=./pgpass_run
echo "[INFO] Authentication configured!"

echo "[INFO] Backing up $1..."
pg_dump -h $srcdbhost -U $srcdbuser --format=c --blobs $srcdbname --file=./db.dump --clean
echo "[INFO] Backing up $1..."

echo "[INFO] Cleaning Up..."
rm ./pgpass_run
echo "[INFO] Cleaning Up "

echo "[INFO] Done."
 
