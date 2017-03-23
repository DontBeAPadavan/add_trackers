#!/bin/sh

# Get transmission credentials
auth=$(nvram get http_username):$(nvram get http_passwd)

add_trackers () {
    torrent_hash=$1
    base_url='https://torrentz2.eu'
    pattern='announcelist_[0-9]+'

    announce_list=`wget --no-check-certificate -qO - ${base_url}/${torrent_hash} | grep -Eo "${pattern}"`

    if [ -z "$announce_list" ] ; then
        echo 'No additional trackers found, sorry.'
        continue
    fi

    echo "adding trackers for $torrent_hash..."

    for tracker in $(wget -qO - ${base_url}/${announce_list}) ; do
        echo -n "* ${tracker}..."
        if [ -z "$(transmission-remote  --auth=$auth --torrent ${torrent_hash} -td ${tracker} | grep 'success')" ]; then
            echo ' failed.'
        else
            echo ' done.'
        fi
    done
}

# Get list of active torrents
ids="$(transmission-remote --auth=$auth --list | grep -vE 'Seeding|Stopped' | grep '^ ' | awk '{ print $1 }')"

for id in $ids ; do
    echo "Processing torrent #$id..."
    hash="$(transmission-remote --auth=$auth  --torrent $id --info | grep '^  Hash: ' | awk '{ print $2 }')"
    add_trackers $hash
done
