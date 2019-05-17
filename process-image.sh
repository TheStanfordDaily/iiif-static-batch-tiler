#!/bin/sh
LINE=$((AWS_BATCH_JOB_ARRAY_INDEX + 1))
DIR=$(sed -n ${LINE}p /tmp/files.txt)
aws s3 cp s3://stanforddailyarchive/${DIR} input/. --recursive
    ls input |
    while read x ; do
    python iiif_static.py -d ${DIR} -p https://tiles.archives.stanforddaily.com -t 1024 -i $x $x ;
    done
# aws s3 cp out s3://stanforddailyarchive-tiled --recursive
az storage blob upload-batch -s out -d stanforddailyarchive-tiled