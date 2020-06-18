#!/bin/bash
KEY=eyJrIjoiV2lFeGduQ3dsM1V1MzlpVDQxNWtkVkR1MU9Fa014WGkiLCJuIjoiaW1wb3J0IiwiaWQiOjF9
HOST="http://localhost:3000"
if [ ! -d dashboards ] ; then
    mkdir -p dashboards;
fi
for dash in $(curl -sSL -k -H "Authorization: Bearer $KEY" $HOST/api/search\?query\=\& | jq '.' |grep -i uri|awk -F '"uri": "' '{ print $2 }'|awk -F '"' '{print $1 }'); do
  curl -sSL -k -H "Authorization: Bearer ${KEY}" "${HOST}/api/dashboards/${dash}" > dashboards/$(echo ${dash}|sed 's,db/,,g').json
done


