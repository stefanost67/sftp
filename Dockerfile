FROM debian:latest
LABEKL maintainer stefano.stalio@gmail.com

RUN apt-get update && \
    apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

# This because we might need to access a folder owned by www-data
# and the entrypoint script does not work on already existing users 
RUN userdel www-data

COPY files/sshd_config /etc/ssh/sshd_config
COPY files/create-sftp-user /usr/local/bin/
COPY files/entrypoint /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
