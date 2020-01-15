#!/bin/bash

# Start mysql
service mysql start
status=$?
if [ $status -ne 0 ]; then
	echo "Failed to start mysql: $status"
	exit $status
fi

# Start nginx
service nginx start
status=$?
if [ $status -ne 0 ]; then
	echo "Failed to start nginx: $status"
	exit $status
fi

# Start php-fpm
service php7.3-fpm start
status=$?
if [ $status -ne 0 ]; then
	echo "Failed to start php-fpm: $status"
	exit $status
fi

while sleep 2; do
	ps aux |grep mysql > /dev/null 2>&1
	PROCESS_MYSQL=$?
	ps aux |grep nginx > /dev/null 2>&1
	PROCESS_NGINX=$?
	ps aux |grep php-fpm > /dev/null 2>&1
	PROCESS_FPM=$?

	if [ $PROCESS_NGINX -ne 0 ]; then
		echo "nginx has exited."
		exit 1
	fi
	if [ $PROCESS_MYSQL -ne 0 ]; then
		echo "mysql has exited."
		exit 1
	fi
	if [ $PROCESS_FPM -ne 0 ]; then
		echo "pfp-fpm has exited."
		exit 1
	fi
done
