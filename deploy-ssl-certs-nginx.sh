#!/bin/bash

###
# nginx
#
# All StartSSL certificates in ~/ have the form <domain>.key and <domain>.crt
# and are concatinated with the class1-cert into $nginx_ssl_dir
###

if [ "$(whoami)" != 'root' ]; then
  echo "Error: $0 requires root/super user access."
  exit 1;
fi

echo Deploy certs to nginx..;

domains=("www.example.com")
nginx_ssl_dir=/etc/nginx/ssl

for domain in "${domains[@]}"
do
  echo Deploying $domain..;
  cat ${domain}.key ${domain}.crt sub.class1.server.ca.pem > ${nginx_ssl_dir}/${domain}.pem
done;

ls -l ${nginx_ssl_dir}/*.pem

echo "Reloading nginx.."
/etc/init.d/nginx reload

