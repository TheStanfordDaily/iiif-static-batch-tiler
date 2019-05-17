# https://docs.aws.amazon.com/batch/latest/userguide/array_index_example.html

curl https://s3.amazonaws.com/stanforddailyarchive/metadata.json -o metadata.json
python3 parse_meta.py
wc -l files.txt | awk '{print $1'} # 18713. So we want 0 - 18712

docker build -t thestanforddaily/archives-batch-tiler .
docker push thestanforddaily/archives-batch-tiler