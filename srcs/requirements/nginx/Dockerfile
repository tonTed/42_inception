FROM alpine:3.17

RUN apk --no-cache update && apk --no-cache add nginx curl openssl

ADD conf/default.conf /etc/nginx/http.d/default.conf
ADD conf/ssl.conf /etc/nginx/ssl/ssl.conf

RUN mkdir -p /etc/nginx/ssl

WORKDIR /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/tblanco.42.fr.pem -keyout /etc/nginx/ssl/tblanco.42.fr.key \
	-config ssl.conf


WORKDIR /

CMD ["nginx", "-g", "daemon off;"]