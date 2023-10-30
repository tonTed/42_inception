FROM alpine:3.17

# Updating packages and installing Nginx.
RUN apk --no-cache update && \
    apk --no-cache add nginx

# Copying Nginx configuration file.
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/http.d/default.conf

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/http.d/default.conf

# Startup command for Nginx.
CMD ["nginx", "-g", "daemon off;"]