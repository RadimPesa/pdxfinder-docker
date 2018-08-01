# PDXFinder-Docker

## Requirements
 * docker
 * docker-compose



## Deployment 

Just clone the repository, copy ssl key and certificate to 

<code>proxy/ssl/server.key</code>
<code>proxy/ssl/server.crt</code>
.

Build images with

<code>docker-compose build</code>

and launch

<code>docker-compose up -d</code>

PDXFinder should be available at 

<code>https://pdxfinder.edirex.ics.muni.cz/</code>

Logs can be checked with

<code>docker-compose logs</code>

When starting on other machine than pdxfinder.edirex.ics.muni.cz, set variable HOST in .env and copy proper ssl files as mentioned above.

## Importing data
This repository includes initial dummy data to start with. To start with your own data exchange file /neo4j-data/graph.tgz with preferred dataset before starting deployment. 

### Creating data

To create neo4j databases files, copy json files to import-data directory, get into container with

<code>docker exec -it container_name /bin/bash</code>

and start import scripts in /import-data.
