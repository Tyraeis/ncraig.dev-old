#!/bin/bash

sudo docker run --rm \
    --volume="$PWD/data/certbot/conf:/etc/letsencrypt" \
    -p 80:80 -p 443:443 \
    -it certbot/certbot \
    certonly --standalone \
    -n --agree-tos -m noahcraig123@gmail.com \
    -d ncraig.dev -d mygpo.ncraig.dev