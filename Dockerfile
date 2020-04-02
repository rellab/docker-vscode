FROM ubuntu:18.04

RUN apt-get update &&\
	apt-get install -y \
	openssl \
	ca-certificates \
	net-tools \
	build-essential \
	git \
	locales \
	sudo \
	whois \
	dumb-init \
	vim \
	curl \
	wget &&\
apt-get clean &&\
rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ARG CODE="https://github.com/cdr/code-server/releases/download/3.0.2/code-server-3.0.2-linux-x86_64.tar.gz"
RUN sudo mkdir -p /opt/code-server &&\
	wget -O /tmp/code-server.tar.gz $CODE &&\
	tar zxvf /tmp/code-server.tar.gz -C /opt/code-server --strip-components 1 &&\
	rm /tmp/code-server.tar.gz
ENV PATH $PATH:/opt/code-server

COPY ./codestart.sh /usr/local/bin/codestart.sh
COPY ./codeuseradd.sh /usr/local/bin/codeuseradd.sh
COPY ./entrypoint.sh /root/entrypoint.sh

ENV CODE_UID        1000
ENV CODE_USER       user
ENV CODE_PASSWORD   user
ENV CODE_GID        1000
ENV CODE_GROUP      user
ENV CODE_HOME       /home/user
ENV CODE_PORT       8181
ENV CODE_GRANT_SUDO   yes

CMD ["/root/entrypoint.sh"]
