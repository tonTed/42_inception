FROM alpine:3.17

RUN apk --no-cache update && apk --no-cache add nginx curl

ADD conf/default.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]