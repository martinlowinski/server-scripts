#!/bin/bash

###
# ejabberd
#
# All StartSSL certificates in ~/ have the form <domain>.key and <domain>.crt
# and are concatinated with the class1-cert into $ejabberd_ssl_dir
###

if [ "$(whoami)" != 'root' ]; then
  echo "Error: $0 requires root/super user access."
  exit 1;
fi

echo Deploy certs to ejabberd..;

domains=("www.example.com")
ejabberd_ssl_dir=/etc/ejabberd

for domain in "${domains[@]}"
do
  echo Deploying $domain..;
  cat ${domain}.key ${domain}.crt > ${ejabberd_ssl_dir}/${domain}.pem
done;

ls -l ${ejabberd_ssl_dir}/*.pem

echo "Reloading ejabberd.."
/etc/init.d/ejabberd reload

