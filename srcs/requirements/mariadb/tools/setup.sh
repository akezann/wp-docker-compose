if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    
    mysql_install_db
    service mysql start
    
    mysql -e "CREATE USER '${MARIADB_LOGIN}'@'localhost' identified by '${MARIADB_PASS}';" &&\
	mysql -e "CREATE DATABASE IF NOT EXISTS wp_database;" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_LOGIN}'@'%' IDENTIFIED BY '${MARIADB_PASS}';" &&\
	mysql -e "FLUSH PRIVILEGES;"
    service mysql stop 
fi
#sleep 5
mysqld
