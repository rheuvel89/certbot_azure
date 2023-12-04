#!/bin/sh

if ! test -f /init; then
    echo "Running certbot for the first time"
    echo "certbot certonly -v --authenticator dns-azure --preferred-challenges dns --noninteractive --agree-tos --email "${EMAIL}" --dns-azure-config /.secrets/certbot/azure.ini -d ${DOMAIN} -d *.${DOMAIN}"
    certbot certonly --authenticator dns-azure --preferred-challenges dns --noninteractive --agree-tos --email "${EMAIL}" --dns-azure-config /.secrets/certbot/azure.ini -d ${DOMAIN} -d *.${DOMAIN}
else
    echo "Renewing certbot"
    certbot renew
fi
cp /etc/letsencrypt/live/${DOMAIN}/fullchain.pem /usr/share/nginx/certificates/
cp /etc/letsencrypt/live/${DOMAIN}/privkey.pem /usr/share/nginx/certificates/

cat /var/log/letsencrypt/letsencrypt.log