#!/bin/bash

if [ ! -d "collections" ]; then
    mkdir collections
fi

aws --no-sign-request s3 sync s3://commoncrawl/cc-index/collections/ collections/ --exclude "*" --include "*/cluster.idx" --include "*/metadata.yaml"
