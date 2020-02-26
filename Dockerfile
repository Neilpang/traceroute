FROM debian:stretch
RUN apt-get update && apt-get install -y curl \
   && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*
COPY besttrace /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/besttrace /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
