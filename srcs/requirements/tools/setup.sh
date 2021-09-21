#!/bin/sh

docker-compose down 
docker system prune 
if [ -d "~/data/" ]; then 
  rm -rf ~/data/
fi 
service docker restart
