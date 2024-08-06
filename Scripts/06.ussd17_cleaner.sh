#!/ban/bash

CONTAINER_NAME="python-runner"

docker cp \
Scripts/clean_ussd17.py \
"$CONTAINER_NAME:/app/temp/clean_ussd17.py"

docker cp \
Data/ussd17.xls \
"$CONTAINER_NAME:/app/temp/ussd17.xls"

docker exec $CONTAINER_NAME python temp/clean_ussd17.py

docker cp \
"$CONTAINER_NAME:app/temp/ussd17.csv" \
./Data
