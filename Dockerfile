FROM alpine:edge

ARG AUUID="ae5060f5-716f-4f91-9da0-04753c32e0b1"
ARG CADDYIndexPage="https://github.com/suahube/pagefiles/raw/main/bongo.cat-master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/suahube/DDok/raw/main/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
