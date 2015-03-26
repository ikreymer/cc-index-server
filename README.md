# Common Crawl Index Server

This project is a deployment of the [pywb](https://github.com/ikreymer/pywb) web archive replay and index server to provide
an index query mechanism for datasets provided by [CommonCrawl](https://commoncrawl.org)


## Usage & Installation
To run locally, please install with `pip install -r requirements.txt`

CommonCrawl stores data on Amazon S3 and the index is publicly accessible from S3.

Currently, individual indexes for each crawl can be accessed under: `s3://aws-publicdatasets/commoncrawl/cc-index/collections/[CC-MAIN-YYYY-WW]`

Most of the index will be served from S3, however, a smaller secondary index must be installed locally for each collection.

This can be done automatically by running: `install-collections.sh` which will install all available collections locally.

This script will use `s3cmd` tool to sync the the index.

If successful, there should be  `collections` directory with at least one index.

To run, simply run `cdx-server` to start up the index server, or optionally `wayback`, to run pywb replay system along with the cdx server.


## CDX Server API

The API endpoints correspond to existing index collections in collections directory.

For example, one currently available index is `CC-MAIN-2015-06` and it can be accessed via

`http://localhost:8080/CC-MAIN-2015-06-index?url=commoncrawl.org`


Refer to [CDX Server API](https://github.com/ikreymer/pywb/wiki/CDX-Server-API) for more detailed instructions on the API itself.

The pywb [README](https://github.com/ikreymer/pywb/blob/master/README.rst) provides additional information about pywb.


## Building the Index

Please see the [webarchive-indexing](https://github.com/ikreymer/webarchive-indexing) repository for more info on how the index is built.
