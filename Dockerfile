FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y curl gcc libpcre3 gzip libpcre3-dev zlibc zlib1g zlib1g-dev make &&  \ 
    curl -O http://nginx.org/download/nginx-0.6.39.tar.gz && \ 
    tar -xzf nginx-0.6.39.tar.gz && \
    rm -rf nginx-0.6.39.tar.gz && \
    cd nginx-0.6.39 && \
    ./configure && \
    sed -i "s,-Werror,," /nginx-0.6.39/objs/Makefile && \
    make install && \
    touch /usr/local/nginx/logs/error.log

CMD /usr/local/nginx/sbin/nginx && tail -f /usr/local/nginx/logs/error.log

EXPOSE 80
    
