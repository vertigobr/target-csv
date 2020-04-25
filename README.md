# target-csv

Singer target for CSV files

## Automated build

This image is built automatically by Docker Hub:

- master --> latest
- github tag --> image tag

## How to use

```sh
cat "data_file" | docker run --rm -ti \
  -v <configs>:/opt/config \
  vertigo/tap-postgres
```

## Sample

```sh
cat sample/input.json | docker run --rm -i \
  -v $PWD/sample:/opt/config \
  targetcsv
```
