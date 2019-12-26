#!/bin/bash
filename=$1
n=1
while read line; do
# reading each line
/bin/bash ip2hosts.sh "$line" >> result_ip2host.txt
n=$((n+1))
done < $filename
