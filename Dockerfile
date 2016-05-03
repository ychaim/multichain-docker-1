FROM ubuntu:xenial
MAINTAINER Lewis Lambert <lewis.lambert@zserve.co.uk>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get upgrade -q -y \
	&& apt-get install -q -y wget \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& cd /tmp \
	&& wget http://www.multichain.com/download/multichain-1.0-alpha-20.tar.gz \
	&& tar -xvzf multichain-1.0-alpha-20.tar.gz \
	&& cd multichain-1.0-alpha-20 \
	&& mv multichaind multichain-cli multichain-util /usr/local/bin \
	&& cd /tmp \
	&& rm -Rf multichain*

VOLUME [ "/opt/chains" ]

EXPOSE 8333 8332 18333 18332

ENTRYPOINT [ "/usr/local/bin/multichaind", "-datadir=/opt/chains" ]
