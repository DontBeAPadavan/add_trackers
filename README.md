# Get more trackers

See no peers for some torrent? Add more trackers from torrentz.eu.

## Installation

* [Install](https://bitbucket.org/padavan/rt-n56u/wiki/EN/HowToConfigureEntware) Entware,
* Install necesary packages:

```
opkg install transmission-remote-openssl
```

* Download script and make it executable:

```
wget --no-check-certificate -O /opt/bin/add_trackers.sh https://raw.githubusercontent.com/DontBeAPadavan/add_trackers/master/opt/bin/add_trackers.sh
chmod +x /opt/bin/add_trackers.sh
```

## Usage

Run script to add some more trackers for active torrents:

```
add_trackers.sh
Processing ID #56...
No additional trackers found, sorry.
Processing ID #77...
adding trackers for 03691e7963a838cc2555fb357a1aaef0c0037b82...
* http://www.opentrackr.org/announce... failed.
* http://mgtracker.org:2710/announce... failed.
Processing ID #88...
No additional trackers found, sorry.
Processing ID #94...
adding trackers for 620c571308ee3d4b3f3f0811aaef0c45361b29a5...
* http://www.opentrackr.org/announce... done.
* http://tracker.bittorrent.am/announce... done.
* http://retracker.krs-ix.ru:80/announce... done.
* http://mgtracker.org:2710/announce... done.
* http://explodie.org:6969/announce... done.
```

Don't be confused with `failed` message. In most cases, it means tracker(s) already added and/or exists in current torrent.
