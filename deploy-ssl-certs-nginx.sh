#!/bin/bash

if [ "$(whoami)" != 'root' ]; then
  echo "Error: $0 requires root/super user access."
  exit 1;
fi

###
# nginx
###
echo Deploy certs to nginx..;
domains=("webmail.halfthetruth.de" "www.goldtopf.org")

for domain in "${domains[@]}"
do
  echo Deploying $domain..;
  cat ${domain}.key ${domain}.crt sub.class1.server.ca.pem > /etc/nginx/ssl/${domain}.pem
done;

ls -l /etc/nginx/ssl/*.pem

echo "Reloading nginx.."
/etc/init.d/nginx reload

