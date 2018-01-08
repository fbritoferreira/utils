#!/bin/bash
dbhost=$1
dbuser=$2
dbname=$2
dbpass=$3

echo "[INFO] Started..."
echo "[INFO] Setting up authentication for $1..."
echo "$dbhost:5432:$dbname:$dbuser:$dbpass" > ./pgpass_run
chmod 0600 ./pgpass_run
export PGPASSFILE=./pgpass_run
echo "[INFO] Authentication configured!"

echo "[INFO] Restoring $1..."
pg_restore --no-owner -n public --role=$dbname -h $dbhost -U $dbuser -d $dbname ./$4 --clean
echo "[INFO] Restoring $1..."
echo "[INFO] Cleaning Up..."
rm ./pgpass_run
echo "[INFO] Cleaning Up "
echo "[INFO] Done."