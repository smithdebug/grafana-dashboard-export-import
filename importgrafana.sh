#!/bin/bash
KEY=eyJrIjoiV2lFeGduQ3dsM1V1MzlpVDQxNWtkVkR1MU9Fa014WGkiLCJuIjoiaW1wb3J0IiwiaWQiOjF9
HOST="http://localhost:3000"
FILE_DIR=/c/Users/Smith.pereira/Desktop/dashboards

for jsonfile in $FILE_DIR/*.json ;
do
   cat <<<  $(jq '.dashboard.id = null | .dashboard.uid  = null' "$jsonfile") > $jsonfile ;
   curl -k -XPOST "${HOST}/api/dashboards/import" --data-binary @$jsonfile -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer ${KEY}"
   
   
done;

