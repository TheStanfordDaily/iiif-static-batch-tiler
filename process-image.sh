#!/bin/sh
LINE=$((AWS_BATCH_JOB_ARRAY_INDEX + 1))
METS_FILE_PATH=$(sed -n ${LINE}p /tmp/files.txt)
DIR=$(dirname $METS_FILE_PATH)
cd /tmp
mkdir input
aws s3 cp s3://stanforddailyarchive/${METS_FILE_PATH} out/${METS_FILE_PATH} --recursive
aws s3 cp s3://stanforddailyarchive/${DIR}/Stanford_Daily-ALTO/ out/${DIR}/Stanford_Daily-ALTO/ --recursive
# aws s3 cp s3://stanforddailyarchive/${DIR}/Stanford_Daily-IMG/ input --recursive
mkdir input
curl https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png -o input/test.png
    ls input |
    while read x ; do
    python iiif/iiif_static.py -d out/${DIR} -p https://tiles.archives.stanforddaily.com/${DIR} -t 1024 -i $x input/$x ;
    done
# aws s3 cp out s3://stanforddailyarchive-tiled --recursive
ls -R out
az storage blob upload-batch -s out -d stanforddailyarchive-tiled