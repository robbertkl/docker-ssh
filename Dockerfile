FROM alpine:latest
MAINTAINER Robbert Klarenbeek <robbertkl@renbeek.nl>

RUN apk add --no-cache openssh

RUN sed -i 's/^root:!:/root:*:/' /etc/shadow && \
    sed -Ei 's/^#?PasswordAuthentication\s+(yes|no)$/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -Ei 's/^#?ChallengeResponseAuthentication\s+(yes|no)$/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config && \
    sed -Ei 's/^#?AllowTcpForwarding\s+(yes|no)$/AllowTcpForwarding yes/' /etc/ssh/sshd_config && \
    sed -Ei 's/^#?GatewayPorts\s+(yes|no)$/GatewayPorts yes/' /etc/ssh/sshd_config && \
    >/etc/motd
COPY init.sh /

EXPOSE 22

CMD [ "/init.sh" ]
