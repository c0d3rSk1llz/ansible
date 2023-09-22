FROM debian:12.1

ARG UID

RUN adduser --gecos GECOS --disabled-password --uid $UID demo
RUN echo 'demo:demo' | chpasswd

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y dist-upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install locales-all pipx build-essential libpq-dev apt-utils rsyslog openssh-server vim dnsutils sudo net-tools wget gnupg2 dialog python3-full tmux gzip iptables netcat-traditional telnet less

ADD locale /etc/default/locale
ADD demo /etc/sudoers.d/demo
RUN chmod go-rwx /etc/sudoers.d/demo

RUN echo "umask go+rw" >>/etc/bash.bashrc
RUN echo "export PATH=\${HOME}/.local/bin:\${PATH}" >> /etc/bash.bashrc
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod ugo+x /usr/local/bin/entrypoint.sh

RUN mkdir -p /etc/ansible
COPY ansible.cfg /etc/ansible/ansible.cfg

USER demo
ARG workdir=/home/demo/workdir
RUN pipx install --include-deps ansible
RUN mkdir -p ${workdir}
RUN chown demo:demo ${workdir}
WORKDIR ${workdir}
ENV LC_ALL=fr_FR.UTF-8

CMD bash -c /usr/local/bin/entrypoint.sh && sudo service ssh start && sleep infinity
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]



