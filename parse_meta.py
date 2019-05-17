import json
with open('metadata.json') as file:
    with open('files.txt', 'w') as output:
        metadata = json.load(file)
        for year in metadata:
            for month in metadata[year]:
                for day in metadata[year][month]:
                    path = metadata[year][month][day]
                    path, _ = path.split("/Stanford_Daily")
                    output.write(path + "/Stanford_Daily-IMG/" + "\n")