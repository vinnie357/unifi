#!/bin/bash
function updateDns () {
  host=$1
  server=$DNS_HOST
  dnsDomain=$DNS_DOMAIN
  ttl=86400
tee ${PWD}/dns_$host.txt <<EOF
server $server 53
prereq nxdomain ${host}.${dnsDomain}.
update add ${host}.${dnsDomain}. ${ttl} a $(dig @$UDM_HOST $host +short)
send
EOF
nsupdate ${PWD}/dns_$host.txt
rm ${PWD}/dns_$host.txt
}
