FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install wget -y
COPY srcs tmp/

RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=Amouassi"

RUN mv /tmp/default /etc/nginx/sites-available/default

RUN apt-get install php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cli php-cgi -y
RUN apt-get install php-mysql -y
RUN apt-get install php7.3-fpm -y

RUN apt-get install mariadb-server -y
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
RUN mv tmp/wp-config.php var/www/html/wordpress

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.3/phpMyAdmin-4.9.3-all-languages.tar.gz
RUN tar -xf phpMyAdmin-4.9.3-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.3-all-languages /var/www/html/phpmyadmin
RUN mv tmp/config.inc.php /var/www/html/phpmyadmin
RUN chown -R www-data:www-data /var/www/html

RUN sh tmp/databases.sh
RUN apt-get install -y procps
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chmod 777 /var/lib/phpmyadmin/tmp
CMD ["/bin/bash", "tmp/my_wrapper_script.sh"]
