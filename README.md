# https://docs.aws.amazon.com/batch/latest/userguide/array_index_example.html

curl https://s3.amazonaws.com/stanforddailyarchive/metadata.json -o metadata.json
python3 parse_meta.py