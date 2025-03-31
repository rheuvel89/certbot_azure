#!/bin/sh

# /bin/sh



if ! test -f /init; then
    /init.sh
else
    echo "init.sh already run"
fi
while true; do sleep 43200; /certbot.sh; done;
