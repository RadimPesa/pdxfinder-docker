#!/bin/bash

if [ ! -f /data/neo4j-import-done.flag ]; then
    echo "Import database."
    mkdir -p /data/databases/graph.db
    tar -zxvf /neo4j-data/graph.tgz -C /data/databases/graph.db
#    tar -zxvf /neo4j-data/pdx.tgz -C /data/databases/graph.db
    touch /data/neo4j-import-done.flag
    chmod 0777 /data/databases/graph.db/*
else
    echo "The import has already been made."
fi