FROM alpine
ENV NGINX_VERSION 1.19.6
RUN apk update && apk add --no-cache pcre-dev git build-base zlib-dev libressl-dev
WORKDIR /var/nginx
RUN wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
RUN tar -zxf nginx-${NGINX_VERSION}.tar.gz
WORKDIR /var/nginx/nginx-${NGINX_VERSION}
RUN ./configure --prefix=/app --with-http_sub_module --with-http_ssl_module
RUN make --silent && make --silent install

RUN rm -rf /var/nginx
ADD nginx.conf /app/conf/nginx.conf
WORKDIR /app
CMD ["/app/sbin/nginx", "-g", "daemon off;"]
