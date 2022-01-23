#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"
sudo cp -r * /srv/ncraig.dev/
cd /srv/ncraig.dev/

sudo apt-get update
sudo apt-get install nginx

sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot

if [ ! d "/etc/letsencrypt/live/ncraig.dev/" ]; then
    sudo certbot certonly --nginx \
        -n --agree-tos -m noahcraig123@gmail.com \
        -d ncraig.dev
fi

if [ ! -d "blog/_site" ]; then
    ./scripts/build_blog.sh
fi

sudo cp ./nginx/conf.d/* /etc/nginx/conf.d/
