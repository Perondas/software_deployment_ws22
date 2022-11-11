#!/bin/bash

if [ -f "/var/www/html/wp-config.php" ] 
then 
    echo "Wordpress is already installed"
else 
    echo moving wordpress!
    mv /tmp/src/wordpress/* /var/www/html/
    chown -R www-data:www-data /var/www/html/wordpress 
    chmod -R 755 /var/www/html/wordpress 
    mkdir -p /var/www/html/wordpress/wp-content/uploads 
    chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads 
    rm /var/www/html/index.html
    cd /var/www/html
    echo "s/localhost/$WORDPRESS_DB_HOST/g"
    sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config.php
    sed -i "s/database_name_here/$WORDPRESS_DB/g" wp-config.php
    sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config.php
    sed -i "s/password_here/$WORDPRESS_DB_PASS/g" wp-config.php
fi

/etc/init.d/apache2 restart
tail -f /var/log/apache2/access.log