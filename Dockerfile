from alpine as builder
ENV NGINX_VERSION 1.19.6
run apk update && apk add --no-cache pcre-dev git build-base zlib-dev libressl-dev
workdir /var/nginx
run wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
run tar -zxf nginx-${NGINX_VERSION}.tar.gz
workdir /var/nginx/nginx-${NGINX_VERSION}
run ./configure --prefix=/app --with-http_sub_module --with-http_ssl_module
run make --silent && make --silent install

RUN rm -rf /var/nginx
ADD nginx.conf /app/conf/nginx.conf
workdir /app
CMD ["/app/sbin/nginx", "-g", "daemon off;"]
