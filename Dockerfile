FROM ubuntu:15.10
MAINTAINER Matteo Crippa @ghego20

ENV HOME /root
ENV WORK_DIR /root

# Set WORKDIR
WORKDIR ${WORK_DIR}

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get clean -y
RUN apt-get update 
RUN cd /tmp \
	&& wget http://www.multichain.com/download/multichain-1.0-alpha-22.tar.gz \
	&& tar -xvzf multichain-1.0-alpha-22.tar.gz \
	&& cd multichain-1.0-alpha-22 \
	&& mv multichaind multichain-cli multichain-util /usr/local/bin \
	&& cd /tmp \
	&& rm -Rf multichain*

RUN multichain-util create chain1
#RUN multichaind chain1 -daemon

VOLUME ${WORK_DIR}

EXPOSE 4800
