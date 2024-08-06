#!/ban/bash

CONTAINER_NAME=postgres-db
HMDA_SCRIPT="optimize_hmda.sql"

run_in_container() {
  local SCRIPT_NAME=$1

  docker cp "./Scripts/$SCRIPT_NAME" \
  ${CONTAINER_NAME}:/home

  winpty docker exec ${CONTAINER_NAME} bash

  winpty docker exec ${CONTAINER_NAME} psql -U postgres -f "./home/$SCRIPT_NAME"
}

echo "Optimizing HMDA table"
run_in_container $HMDA_SCRIPT

