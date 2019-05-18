# iiif-static-batch-generator
Generates [IIIF](https://iiif.io/) static tiles from images in an S3 bucket and puts them into another S3 bucket.

## Setup
Make sure you create an `.env` file with the following in it:
```
AZURE_STORAGE_CONNECTION_STRING=...
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
```

Pre-processing steps:
```
curl https://s3.amazonaws.com/stanforddailyarchive/metadata.json -o metadata.json
python3 parse_meta.py
wc -l files.txt | awk '{print $1'} # 18713.
```

Local testing steps
```
docker build -t thestanforddaily/archives-batch-tiler .
./test.sh
```

Build and push steps:
```
docker build -t thestanforddaily/archives-batch-tiler .
docker push thestanforddaily/archives-batch-tiler
```

For deployment to AWS Batch, see https://docs.aws.amazon.com/batch/latest/userguide/array_index_example.html

# Running 1 - 10000.
