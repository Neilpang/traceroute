FROM debian:stretch
RUN apt-get update && apt-get install -y wget unzip \
   && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN wget https://cdn.ipip.net/17mon/besttrace4linux.zip \
  && unzip -p besttrace4linux.zip besttrace$([ $(uname -p) = "aarch64" ] && echo "arm") >/usr/local/bin/besttrace \
  && rm -f besttrace4linux.zip \
  && chmod +x /usr/local/bin/besttrace /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]


