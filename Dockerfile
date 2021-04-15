FROM ubuntu:latest

RUN : \
    && apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -qqq --no-install-recommends \
      xinetd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && :
RUN : \
    && useradd -m pwn \
    && chown -R root:root /home/pwn \
    && chmod -R 755 /home/pwn \
    && :

ENTRYPOINT ["/usr/sbin/xinetd","-dontfork"]
