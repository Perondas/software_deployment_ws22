#!/bin/bash
/etc/init.d/mysql restart

echo "CREATE DATABASE $MYSQL_DB ;" | mysql -u root

echo "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASS';"  | mysql -u root

echo "GRANT ALL PRIVILEGES on * . * TO '$MYSQL_USER'@'localhost';FLUSH PRIVILEGES;"  | mysql -u root

echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASS';"  | mysql -u root
 
echo "GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_USER'@'%';FLUSH PRIVILEGES;"  | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root
tail -f /var/log/mysql/error.log
