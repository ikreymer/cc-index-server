#!/bin/bash

if [ ! -d "collections" ]; then
    mkdir collections
fi

s3cmd sync -r --exclude=* --include=cluster.idx s3://aws-publicdatasets/common-crawl/cc-index/collections/ collections/
