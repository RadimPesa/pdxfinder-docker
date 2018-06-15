#!/bin/bash

if [ ! -f /data/neo4j-import-done.flag ]; then
    echo "Import database."
    tar -zxvf /neo4j-data/graph.tgz /data/databases/graph.db
    touch /data/neo4j-import-done.flag
    chmod 0777 /data/databases/graph.db/*
else
    echo "The import has already been made."
fi