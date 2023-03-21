FROM ubuntu:tag

RUN : \
    && apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -qqq --no-install-recommends \
      xinetd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && useradd --shell /bin/false pwn \
    && :

ENTRYPOINT ["/usr/sbin/xinetd","-dontfork"]
