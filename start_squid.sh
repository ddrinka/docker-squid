#!/bin/bash
docker run --restart=always -d --publish 3128:3128 --volume /dev/log:/dev/log --volume /srv/docker/squid/etc/squid.conf:/etc/squid/squid.conf --volume /srv/docker/squid/etc/certs:/etc/squid/certs --volume /srv/docker/squid/etc/passwords:/etc/squid/passwords squid squid -NYCd 1
