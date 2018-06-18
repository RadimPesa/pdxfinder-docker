# PDXFinder-Docker

Run 

<code>docker-compose up -d</code>

PDXFinder should be available at 

<code>http:/localhost:8080/data/search</code>

To import data, copy files to import-data directory, get into container with

<code>docker exec -it container_name /bin/bash</code>

and start import scripts in /import-data.
