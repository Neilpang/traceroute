FROM debian:stretch
RUN apt-get update && apt-get install -y curl
COPY besttrace /usr/local/bin/traceroute
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/traceroute /entrypoint.sh
ENTRYPOINT /entrypoint.sh

