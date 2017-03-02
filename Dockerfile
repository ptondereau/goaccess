FROM debian:jessie

MAINTAINER Pierre TONDEREAU <http://twitter.com/ptondereau1>

ENV GOACCESS_VERSION 1.1.1

RUN apt-get update && \
  apt-get install -y wget git autoconf build-essential libgeoip-dev libncursesw5-dev pkg-config libglib2.0 && \
  git clone https://github.com/allinurl/goaccess.git --branch $GOACCESS_VERSION --depth 1 && \
  cd goaccess && \
  autoreconf -fiv && \
  ./configure --enable-geoip --enable-utf8 && \
  make && make install && \
  apt-get purge -y wget git autoconf build-essential libncursesw5-dev pkg-config && \
  apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* && \
  cd .. && rm -rf goaccess
