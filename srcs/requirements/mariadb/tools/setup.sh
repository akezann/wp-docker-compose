if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    
    mysql_install_db
    service mysql start

    mysqladmin -u root password ${MARIADB_ROOT_PASS} && \
	echo "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};" | mysql -u root -p${MARIADB_ROOT_PASS} && \
	echo "CREATE USER IF NOT EXISTS '${MARIADB_LOGIN}'@'%' IDENTIFIED BY '${MARIADB_PASS}';" | mysql -u root -p${MARIADB_ROOT_PASS} && \
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_LOGIN}'@'%' IDENTIFIED BY '${MARIADB_PASS}';" | mysql -u root -p${MARIADB_ROOT_PASS} && \
	echo "FLUSH PRIVILEGES;" | mysql -u root -p${MARIADB_ROOT_PASS}

    #service mysql stop 
fi

mysqld
