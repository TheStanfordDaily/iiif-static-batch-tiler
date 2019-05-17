#!/bin/sh
LINE=$((AWS_BATCH_JOB_ARRAY_INDEX + 1))
DIR=$(sed -n ${LINE}p /tmp/files.txt)
aws s3 ls s3://stanforddailyarchive/${DIR} | \
    awk '{print $4}' | \
    while read x ; do
    python iiif_static.py -d ${DIR} -p https://tiles.archives.stanforddaily.com -t 1024 -i $x $x ;
    done
aws s3 cp out s3://stanforddailyarchive-tiled --recursive