FROM debian:buster 

RUN apt-get update 
RUN apt-get install -y nginx openssl
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default

COPY tools/nginx.conf /etc/nginx/sites-available/default  
 
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/nginx/ssl/www.akezanna.42.fr.crt -keyout /etc/nginx/ssl/www.akezanna.42.fr.key -subj "/C=AR/ST=BErkane/CN=Abdou1337"
RUN chmod 777 /etc/nginx/ssl/*
RUN chmod 777 -R /var/www 
RUN chown -R www-data:www-data /var/www/
RUN echo "127.0.0.1  akezanna.42.fr" >> /etc/hosts

EXPOSE 443 
ENTRYPOINT ["nginx","-g","daemon off;"]

