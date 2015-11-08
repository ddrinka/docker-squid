#!/bin/bash
docker run -it --rm --publish 3128:3128 --volume /srv/docker/squid/etc/squid.conf:/etc/squid/squid.conf --volume /srv/docker/squid/etc/certs:/etc/squid/certs --volume /srv/docker/squid/etc/passwords:/etc/squid/passwords squid squid -NYCd 1
