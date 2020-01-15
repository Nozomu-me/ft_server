#!bin/sh
service mysql start
mysql  < /var/www/html/phpmyadmin/sql/create_tables.sql
mysql -uroot -e "CREATE USER 'amal'@'localhost' IDENTIFIED BY 'amal';"
mysql -uroot -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'amal'@'localhost' IDENTIFIED BY 'amal';"
mysql -uroot -e "CREATE USER 'amouassi'@'localhost' IDENTIFIED BY 'amouassi';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'amouassi'@'localhost' WITH GRANT OPTION;"
mysql -uroot -e "CREATE DATABASE wordpress_db;"
mysql -uroot -e "GRANT ALL ON wordpress_db.* TO 'amal'@'localhost'"
