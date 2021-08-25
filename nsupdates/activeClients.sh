#!/bin/bash
function activeClients () {
user=${1:-$UDM_USER}
pass=${2:-$UDM_PASS}
site=${3:-$UDM_SITE}
UDM=${4:-$UDM_HOST}
loginUrl="api/auth/login"
prefixUrl="proxy/network/api/s/"
clientsUrl="stat/sta"
curl -sk -X POST -H 'content-type: application/json' -H 'Expect:' --data "{\"username\": \"${user}\", \"password\": \"$pass\",\"rememberMe\":false }" --cookie-jar cookie.txt https://$UDM/$loginUrl > /dev/null
# curl -k -X GET -b cookie.txt https://$UDM/proxy/network/api/s/${site}/self
# curl -k -X GET -b cookie.txt https://$UDM/proxy/network/api/s/${site}/stat/sta
curl -sk -X GET -b cookie.txt https://$UDM/${prefixUrl}/${site}/${clientsUrl} | jq -r .data[].hostname
rm cookie.txt
}
