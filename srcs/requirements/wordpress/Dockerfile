FROM alpine:3.17

RUN apk --no-cache update && \
    apk --no-cache add php81 php81-fpm php81-mysqli php81-pdo php81-pdo_mysql

ADD ./conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN mkdir -p /var/www/html
ADD tools/index.php /var/www/html/index.php


EXPOSE 9000

CMD ["php-fpm81", "--nodaemonize"]