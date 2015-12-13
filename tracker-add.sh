#!/bin/bash

torrent_hash=$1
base_url='http://torrentz.eu'
pattern='announcelist_[0-9]+'

if [ -z "$1" ] ; then
    echo "usage: ./tracker-add sh <hash>"
    exit 1
fi

announce_list=`curl -s ${base_url}/${torrent_hash} | grep -Eo "${pattern}"`

for tracker in $(curl -s ${base_url}/${announce_list})
do
  echo "Adding ${tracker} to torrent ${torrent_hash}"
  transmission-remote -t ${torrent_hash} -td ${tracker}
done
