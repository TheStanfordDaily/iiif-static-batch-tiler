AWS_BATCH_JOB_ARRAY_INDEX=0
LINE_COUNT=$(wc -l files.txt | awk '{print $1'})
while [ $AWS_BATCH_JOB_ARRAY_INDEX -le 0 ]
do
    docker run -i -e AWS_BATCH_JOB_ARRAY_INDEX=$AWS_BATCH_JOB_ARRAY_INDEX --env-file .env tsd-archives-tiler
    AWS_BATCH_JOB_ARRAY_INDEX=$((AWS_BATCH_JOB_ARRAY_INDEX + 1))
done