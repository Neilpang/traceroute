FROM alpine:3

RUN apk update -f \
  && apk --no-cache add -f \
  wget ca-certificates unzip


COPY entrypoint.sh /entrypoint.sh

RUN wget https://cdn.ipip.net/17mon/besttrace4linux.zip \
  && unzip -p besttrace4linux.zip besttrace$(uname -a | grep -o aarch >/dev/null && echo "arm") >/usr/local/bin/besttrace \
  && rm -f besttrace4linux.zip \
  && chmod +x /usr/local/bin/besttrace /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]


