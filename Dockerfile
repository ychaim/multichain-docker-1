FROM ubuntu:16.04
MAINTAINER Matteo Crippa @ghego20

ENV PACKAGE_NAME multichain-1.0-alpha-23
ENV HOME /root
ENV WORK_DIR /root

# Set WORKDIR
WORKDIR ${WORK_DIR}

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y monit
RUN apt-get install -y upstart
RUN apt-get clean -y
RUN apt-get update

# Multichain install
RUN cd /tmp \
	&& wget http://www.multichain.com/download/${PACKAGE_NAME}.tar.gz \
	&& tar -xvzf ${PACKAGE_NAME}.tar.gz \
	&& cd ${PACKAGE_NAME} \
	&& mv multichaind multichain-cli multichain-util /usr/local/bin \
	&& cd /tmp \
	&& rm -Rf multichain*

# Multichain setup
RUN multichain-util create chain1 

# Monit setup
COPY multichain.conf  /etc/init/
COPY monit-multichain.conf  /etc/monit/


# Run monit
CMD ["/usr/bin/monit", "-I"]

EXPOSE 18333
