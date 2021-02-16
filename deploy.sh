#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"
sudo cp -r * /srv/ncraig.dev/
cd /srv/ncraig.dev/

if [ ! -d "data/certbot/conf/live" ]; then
    ./scripts/init_certs.sh
fi

if [ ! -d "blog/_site" ]; then
    ./scripts/build_blog.sh
fi

sudo cp ./website.service /etc/systemd/system/website.service
sudo systemctl enable --now website
