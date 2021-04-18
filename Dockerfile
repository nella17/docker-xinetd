FROM ubuntu:latest

RUN : \
    && apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -qqq --no-install-recommends \
      xinetd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && :

RUN useradd --shell /bin/false pwn
COPY --chown=root:root ./xinetd /etc/xinetd.d/pwn
COPY --chown=root:root ./home/ /home/pwn/
EXPOSE 8888

ENTRYPOINT ["/usr/sbin/xinetd","-dontfork"]
