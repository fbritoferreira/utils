#!/bin/bash
file=$1
while IFS= read -r link
do
  echo "[INFO] Downloading $link"
   if wget "$link" --directory /tmp/linkchecker > /dev/null 2>&1;
    then echo "[INFO] Link working: $link"
    else echo "[ERROR] Link NOT working: $link"
  fi
done < <(grep -v '^ *#' < "$file")