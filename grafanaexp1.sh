#!/bin/bash
KEY=*****
HOST="*******"
if [ ! -d dashboards ] ; then
    mkdir -p dashboards;
fi
for dash in $(curl -sSL -k -H "Authorization: Bearer $KEY" $HOST/api/search\?query\=\& | jq '.' |grep -i uri|awk -F '"uri": "' '{ print $2 }'|awk -F '"' '{print $1 }'); do
  curl -sSL -k -H "Authorization: Bearer ${KEY}" "${HOST}/api/dashboards/${dash}" > dashboards/$(echo ${dash}|sed 's,db/,,g').json
done


