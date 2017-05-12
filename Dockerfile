
FROM alpine:latest

RUN apk update && apk add bash file libc6-compat wget

RUN mkdir -p /lib64 && ln -s /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

COPY ./install.expect /root/f5fpc/install.expect

RUN cd /root/f5fpc && wget --no-check-certificate https://72.3.241.247/public/download/linux_sslvpn.tgz && tar xfz linux_sslvpn.tgz && yes "yes" | ./Install.sh && rm -rf /root/f5fpc

CMD /usr/local/bin/f5fpc \
        --start \
        --user ${USER} \
        --password ${PASSWORD} \
        --host ${HOST} \
        --nocheck \
    || /bin/sleep infinity

