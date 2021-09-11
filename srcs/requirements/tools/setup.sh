#!/bin/sh

service nginx stop 
service mysql stop 
source ../.env
docker-compose down 
docker system prune 
# if [ -d "~/data/" ]; then 
#   rm -rf ~/data/
# fi 
service docker restart 
