#!/bin/bash
ln -s /log-dev/log /dev/log
squid -NYCd 1
