#!/bin/sh

set -e

BRANCH=$1

touch ~/gitlab-ci_init_deploy.log
echo "start initial deployment" >> ~/gitlab-ci_init_deploy.log

if [ "$BRANCH" == "master" ]; then
  sudo certbot certonly --standalone --non-interactive --force-renewal --agree-tos -m dataportal-edirex@ics.muni.cz -d dataportal.edirex.ics.muni.cz
else
  sudo certbot certonly --standalone --non-interactive --force-renewal --agree-tos -m dataportal-edirex@ics.muni.cz -d dataportal-$BRANCH.edirex.ics.muni.cz
fi

echo "created certificate" >> ~/gitlab-ci_init_deploy.log

sudo cp /etc/letsencrypt/live/dataportal-beta.edirex.ics.muni.cz/fullchain.pem ~/dataportal-docker/proxy/ssl/server.crt
sudo cp /etc/letsencrypt/live/dataportal-beta.edirex.ics.muni.cz/privkey.pem ~/dataportal-docker/proxy/ssl/server.key

echo "certificate placed" >> ~/gitlab-ci_init_deploy.log

cp ~/credentials/dataportal/* ~/dataportal-docker/proxy/mellon/
cd ~ && rm -rf credentials

echo "mellon metadata placed" >> ~/gitlab-ci_init_deploy.log

cd ~/dataportal-docker
git checkout $BRANCH
git pull

echo "PORTAL_BRANCH=$BRANCH" >> .env

docker-compose pull
docker-compose up -d

echo "dataportal started" >> ~/gitlab-ci_init_deploy.log
echo "deployment successful" >> ~/gitlab-ci_init_deploy.log
