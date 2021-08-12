FROM debian:stretch
RUN apt-get update && apt-get install -y wget unzip \
   && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*

RUN wget https://cdn.ipip.net/17mon/besttrace4linux.zip \
  && unzip -p besttrace4linux.zip besttrace >/usr/local/bin/besttrace \
  && rm -f besttrace4linux.zip \
  && chmod +x /usr/local/bin/besttrace


COPY entrypoint.sh /entrypoint.sh
RUN /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


