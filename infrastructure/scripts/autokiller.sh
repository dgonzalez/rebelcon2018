#!/usr/bin/env bash

journalctl --since "1 second ago" -f -u falco -o json --no-pager | jq --unbuffered -r '.MESSAGE | select(startswith("{")) | fromjson | .output_fields | select(.["container.id"] != null) | select(.["container.id"] != "host") | .["container.id"] ' |\
while read key
do
  echo "Killing container with id: $key"
  docker kill $key
done