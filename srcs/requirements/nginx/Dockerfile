FROM alpine:3.17

# Updating packages and installing Nginx.
RUN apk --no-cache update && \
    apk --no-cache add nginx

# Startup command for Nginx.
CMD ["nginx", "-g", "daemon off;"]