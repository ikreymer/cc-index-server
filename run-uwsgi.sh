#!/bin/sh

# requires uwsgi
pip install uwsgi

# running with gevent
pip install gevent

if [ $? -ne 0 ]; then
    "uwsgi install failed"
    exit 1
fi

mypath=$(cd `dirname $0` && pwd)

params="$mypath/uwsgi.ini"

uwsgi $params
