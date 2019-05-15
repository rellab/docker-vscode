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

ARG CODE="https://github.com/cdr/code-server/releases/download/1.939-vsc1.33.1/code-server1.939-vsc1.33.1-linux-x64.tar.gz"
RUN sudo mkdir -p /opt/code-server &&\
    wget -O /tmp/code-server.tar.gz $CODE &&\
    tar zxvf /tmp/code-server.tar.gz -C /opt/code-server --strip-components 1 &&\
    rm /tmp/code-server.tar.gz
ENV PATH $PATH:/opt/code-server

COPY ./csstart.sh /usr/local/bin/csstart.sh
COPY ./csuseradd.sh /usr/local/bin/csuseradd.sh
COPY ./entrypoint.sh /root/entrypoint.sh

ENV C9UID        1000
ENV C9USER       user
ENV C9PASSWORD   user
ENV C9GID        1000
ENV C9GROUP      user
ENV C9HOME       /home/user
ENV C9PORT       8181
ENV C9GRANT_SUDO   yes

CMD ["/root/entrypoint.sh"]
