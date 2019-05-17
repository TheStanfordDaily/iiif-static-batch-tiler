#!/bin/sh
LINE=$((AWS_BATCH_JOB_ARRAY_INDEX + 1))
DIR=$(sed -n ${LINE}p /tmp/files.txt)
cd /tmp
aws s3 cp s3://stanforddailyarchive/${DIR} input/. --recursive
    ls input |
    while read x ; do
    python iiif/iiif_static.py -d out/${DIR} -p https://tiles.archives.stanforddaily.com -t 1024 -i $x input/$x ;
    done
# aws s3 cp out s3://stanforddailyarchive-tiled --recursive
az storage blob upload-batch -s out -d stanforddailyarchive-tiled