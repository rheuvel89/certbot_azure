FROM alpine:latest

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools certbot certbot-dns-azure

RUN mkdir -p /.secrets/certbot && chmod 700 /.secrets/certbot && mkdir -p /tmp

COPY ./entrypoint.sh /
COPY ./init.sh /
COPY ./certbot-template.sh /tmp/
COPY ./azure-template.ini /tmp/

RUN apk add nano

RUN ["chmod", "+x", "/entrypoint.sh"]
RUN ["chmod", "+x", "/init.sh"]
ENTRYPOINT ["/entrypoint.sh"]
