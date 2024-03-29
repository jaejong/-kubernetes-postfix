FROM alpine:3.17

RUN apk add --no-cache \
        bash \
        ca-certificates \
        libsasl \
        mailx \
        postfix \
        rsyslog \
        runit \
        bind-tools \
        postfix-policyd-spf-perl

COPY service /etc/service
COPY usr/sbin/runit_bootstrap /usr/sbin/runit_bootstrap
COPY etc/rsyslog.conf /etc/rsyslog.conf

RUN ln -sf /dev/stdout /var/log/mail.log

STOPSIGNAL SIGKILL

ENTRYPOINT ["/usr/sbin/runit_bootstrap"]
