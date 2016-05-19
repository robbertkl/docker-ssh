#!/bin/sh

if [ -z "${AUTHORIZED_KEYS}" ]
then
	>&2 echo "ERROR: make sure \$AUTHORIZED_KEYS contains at least 1 key"
	exit 1
fi

if ! ls /etc/ssh/ssh_host_* 1> /dev/null 2>&1
then
	ssh-keygen -A
fi

mkdir -p /root/.ssh
chmod 700 /root/.ssh

echo "${AUTHORIZED_KEYS}" | tr , "\n" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

exec /usr/sbin/sshd -D
