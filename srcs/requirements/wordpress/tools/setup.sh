if  [ ! -f /var/www/wordpress/wp-config.php ]; then 
    wp core --allow-root download --locale=en_US --force 
    while  [ ! -f /var/www/wordpress/wp-config.php ]; do
        wp core config --allow-root --dbname=wp_database --dbuser=$MARIADB_LOGIN --dbpass=$MARIADB_PASS --dbhost=mariadb:3306
    done 
    wp core install --allow-root --url='akezanna.42.fr' --title='Hi from akezanna , inception docker compose' --admin_user=$WPADMIN_LOGIN --admin_password=$WPADMIN_PASS  --admin_email="abdou@abdou.fr" --path='/var/www/wordpress';
    wp  user create --allow-root $WPUSER_LOGIN user@user.com --user_pass=$WPUSER_PASS --role=author
    wp theme install --allow-root oceanwp --activate     
fi
php-fpm7.3 --nodaemonize

