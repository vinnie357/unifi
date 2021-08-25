#!/bin/bash
function update () {
  # env vars
  # UDM_USER="myuser"
  # UDM_PASS="mypass"
  # UDM_HOST=udm.example.com
  # UDM_SITE=default
  # DNS_HOST=dns.example.com
  # DNS_DOMAIN=example.com
  #requires
  #  - curl
  #  - jq
  #  - tee
  #  - nsupdate
  # load helper functions
  . activeClients.sh
  . updateDns.sh
  list=$(activeClients)
  for client in $list; do
    echo "  $client"
    if [ "$client" != "null" ]; then
      echo "    Updating $client"
      updateDns $client
    fi
  done
}
