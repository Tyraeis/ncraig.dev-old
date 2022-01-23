#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"
sudo mkdir /srv/ncraig.dev/
sudo cp -r * /srv/ncraig.dev/
cd /srv/ncraig.dev/

sudo apt-get update
sudo apt-get install nginx docker.io

sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot

if sudo [ ! -d "/etc/letsencrypt/live/ncraig.dev/" ]; then
    sudo certbot certonly --nginx \
        -n --agree-tos -m noahcraig123@gmail.com \
        -d ncraig.dev
fi

if [ ! -d "blog/_site" ]; then
    ./scripts/build_blog.sh
fi

if [ -e "/etc/nginx/sites-enabled/default" ]; then
    sudo rm /etc/nginx/sites-enabled/default
fi

sudo cp ./nginx/conf.d/* /etc/nginx/conf.d/
sudo nginx -s reload
