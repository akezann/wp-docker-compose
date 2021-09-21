NAME = inception
START_PATH = ./srcs/
include srcs/.env

all: purge setup reload

setup:
	mkdir /home/ak1337/data && mkdir /home/ak1337/data/wp && mkdir /home/ak1337/data/db
	@ cd $(START_PATH)/requirements/tools && sudo sh setup.sh
	
stop:
	@ cd $(START_PATH) && docker-compose down; 

clean: stop
	@ cd $(START_PATH) && docker system prune; 

purge: clean
	@ sudo rm -rf /home/ak1337/data;

reload: 
	@ cd $(START_PATH) &&  docker-compose up --build;