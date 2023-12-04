#!/bin/sh

cat /tmp/azure-template.ini | sed 's/${CLIENT_ID}/'${CLIENT_ID}'/g' | sed 's/${CLIENT_SECRET}/'${CLIENT_SECRET}'/g' | sed 's/${TENANT_ID}/'${TENANT_ID}'/g'  | sed 's|${DNS_ZONE}|'${DNS_ZONE}'|g' > /.secrets/certbot/azure.ini \
    && chmod 600 /.secrets/certbot/azure.ini \
    && cat /tmp/certbot-template.sh | sed 's/${EMAIL}/'${EMAIL}'/g' | sed 's/${DOMAIN}/'${DOMAIN}'/g' > /certbot.sh \
    && chmod +x /certbot.sh \
    && /certbot.sh \
    && touch init \
