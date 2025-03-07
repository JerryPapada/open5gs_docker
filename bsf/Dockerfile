ARG OPEN5GS_VERSION="v2.7.2"

FROM base:${OPEN5GS_VERSION} AS builder

FROM ubuntu:22.04

# environment variables
ENV OPEN5GS_NF="bsf"

# install dependencies
RUN apt-get update && apt-get install libgnutls28-dev libgcrypt-dev libtalloc-dev \
    libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libyaml-dev -y

# change working directory
WORKDIR /open5gs

# copy executable, default config and libs
COPY --from=builder /open5gs/install/bin/open5gs-bsfd /open5gs/install/bin/open5gs-bsfd
COPY --from=builder /open5gs/install/etc/open5gs/bsf.yaml /open5gs/install/etc/open5gs/bsf.yaml
COPY --from=builder /open5gs/install/etc/open5gs/tls/ca.crt /open5gs/install/etc/open5gs/tls/bsf.crt /open5gs/install/etc/open5gs/tls/bsf.key /open5gs/install/etc/open5gs/tls/
COPY --from=builder /open5gs/install/lib/x86_64-linux-gnu/libogscrypt.so.2 /open5gs/install/lib/x86_64-linux-gnu/libogsproto.so.2 \
/open5gs/install/lib/x86_64-linux-gnu/libogscore.so.2 /open5gs/install/lib/x86_64-linux-gnu/libogssbi.so.2 /open5gs/install/lib/x86_64-linux-gnu/libogsapp.so.2 \
/open5gs/install/lib/x86_64-linux-gnu/libogssbi-openapi.so.2 /open5gs/install/lib/x86_64-linux-gnu/

# create directory to store the logs
RUN mkdir -p /open5gs/install/var/log/open5gs/

ENTRYPOINT [ "/open5gs/install/bin/open5gs-bsfd" ]

# use CMD to provide arguments to ENTRYPOINT (can be overridden by user)
CMD [ "-c", "/open5gs/install/etc/open5gs/bsf.yaml" ]