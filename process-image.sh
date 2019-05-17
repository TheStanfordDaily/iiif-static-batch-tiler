#!/bin/sh
LINE=$((AWS_BATCH_JOB_ARRAY_INDEX + 1))
METS_FILE_PATH=$(sed -n ${LINE}p /tmp/files.txt)
DIR=$(dirname $METS_FILE_PATH)
cd /tmp
mkdir input
aws s3 cp s3://stanforddailyarchive/${METS_FILE_PATH} out/${METS_FILE_PATH}
aws s3 cp s3://stanforddailyarchive/${DIR}/Stanford_Daily-ALTO/ out/${DIR}/Stanford_Daily-ALTO/ --recursive
aws s3 cp s3://stanforddailyarchive/${DIR}/Stanford_Daily-IMG/ input --recursive
# Try one file
# aws s3 cp s3://stanforddailyarchive/${DIR}/Stanford_Daily-IMG/Stanford_Daily_18921010_0001_0001.jp2 input/Stanford_Daily_18921010_0001_0001.jp2
ls input | while read x ; do
python iiif/iiif_static.py -d out/${DIR}/Stanford_Daily-IMG/ -p https://tiles.archives.stanforddaily.com/${DIR}/Stanford_Daily-IMG -t 1024 -i $x input/$x ;
done

aws s3 cp out s3://stanforddailyarchive-tiled --recursive
# az storage blob upload-batch -s out -d stanforddailyarchive-tiled

# az storage blob delete-batch -s stanforddailyarchive-tiled