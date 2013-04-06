#!/bin/bash

if [ "$(whoami)" != 'root' ]; then
  echo "Error: $0 requires root/super user access."
  exit 1;
fi

###
# ejabberd 
###
echo Deploy certs to ejabberd..;
domains=("www.goldtopf.org")

for domain in "${domains[@]}"
do
  echo Deploying $domain..;
  cat ${domain}.key ${domain}.crt > /etc/ejabberd/${domain}.pem
done;

ls -l /etc/ejabberd/*.pem

echo "Reloading ejabberd.."
/etc/init.d/ejabberd restart

