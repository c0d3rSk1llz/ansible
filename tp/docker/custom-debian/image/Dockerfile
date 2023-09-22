FROM debian:12.1

ARG UID

RUN adduser --gecos GECOS --disabled-password --uid $UID demo
RUN echo 'demo:demo' | chpasswd

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y dist-upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install locales-all pipx build-essential libpq-dev apt-utils rsyslog openssh-server vim dnsutils sudo net-tools wget gnupg2 dialog python3-full tmux gzip iptables git telnet netcat-traditional less

ADD locale /etc/default/locale
ADD demo /etc/sudoers.d/demo
RUN chmod go-rwx /etc/sudoers.d/demo

RUN echo "umask go+rw" >>/etc/bash.bashrc
ENV LC_ALL=fr_FR.UTF-8

USER demo

CMD bash -c "sudo service ssh start && sleep infinity"
