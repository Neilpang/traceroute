FROM debian:stretch

RUN apt-get update && apt-get install -y wget unzip \
   && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh

RUN wget https://cdn.ipip.net/17mon/besttrace4linux.zip \
  && if uname -a | grep -o aarch >/dev/null; then \
     unzip -p besttrace4linux.zip besttracearm >/usr/local/bin/besttrace ; \
  else \
     unzip -p besttrace4linux.zip besttrace >/usr/local/bin/besttrace ; \
  fi \
  && rm -f besttrace4linux.zip \
  && chmod +x /usr/local/bin/besttrace /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]


