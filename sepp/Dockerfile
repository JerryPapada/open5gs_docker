ARG OPEN5GS_VERSION="v2.7.2"

FROM base:${OPEN5GS_VERSION} AS builder

FROM ubuntu:22.04

# environment variables
ENV OPEN5GS_NF="sepp"

# install dependencies
RUN apt-get update && apt-get install libgnutls28-dev libgcrypt-dev libtalloc-dev \
    libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libyaml-dev libmongoc-dev -y

# change working directory
WORKDIR /open5gs

# copy executable, default config and libs
COPY --from=builder /open5gs/install/bin/open5gs-seppd /usr/local/bin/open5gs-seppd
COPY --from=builder /open5gs/install/etc/open5gs/sepp1.yaml /etc/open5gs/default/sepp.yaml
COPY --from=builder /open5gs/install/etc/open5gs/tls/ca.crt /open5gs/install/etc/open5gs/tls/sepp1.crt \
/open5gs/install/etc/open5gs/tls/sepp1.key /etc/open5gs/default/tls/
COPY --from=builder /open5gs/install/lib/*/libogsproto.so.2 /open5gs/install/lib/*/libogscore.so.2 \
/open5gs/install/lib/*/libogssbi.so.2 /open5gs/install/lib/*/libogsapp.so.2 /open5gs/install/lib/*/libogssbi-openapi.so.2 \
/open5gs/install/lib/*/libogscrypt.so.2 /usr/local/lib/

# configure dynamically linked libraries
RUN ldconfig

# create directory to store the logs
RUN mkdir -p /open5gs/install/var/log/open5gs/

ENTRYPOINT [ "open5gs-seppd" ]

# use CMD to provide arguments to ENTRYPOINT (can be overridden by user)
CMD [ "-c", "/open5gs/install/etc/open5gs/sepp.yaml" ]