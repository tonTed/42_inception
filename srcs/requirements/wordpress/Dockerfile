FROM alpine:3.17

RUN apk --no-cache update && \
    apk --no-cache add php81 php81-fpm php81-mysqli php81-pdo php81-pdo_mysql && \
	apk --no-cache add wget

ADD ./conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN mkdir -p /var/www/html

ADD tools/index.php /var/www/html/index.php

WORKDIR /var/www

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P .
RUN tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# ADD conf/wp-config.php /var/www/wordpress/wp-config.php


EXPOSE 9000

CMD ["php-fpm81", "--nodaemonize"]