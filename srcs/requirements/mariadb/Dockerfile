FROM debian:buster 

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY tools/setup.sh . 
RUN chmod +x setup.sh 

EXPOSE 3306
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf 
# Swith off the bind address 
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d 
ENTRYPOINT ["sh", "/setup.sh"]
