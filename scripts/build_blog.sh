#!/bin/bash

sudo docker run --rm \
    --volume="$PWD/blog:/srv/jekyll" \
    --volume="$PWD/data/blog/bundle:/usr/local/bundle" \
    -e JEKYLL_UID=`id -u` \
    -e JEKYLL_GID=`id -g` \
    -it jekyll/jekyll:4 \
    jekyll build

sudo cp -r ./blog/_site/ /var/www/ncraig.dev/