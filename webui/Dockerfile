ARG OPEN5GS_VERSION="v2.7.2"

FROM base:${OPEN5GS_VERSION} AS builder

FROM node:19

#add this line to copy webui from base image
COPY --from=builder /open5gs/webui /usr/src/open5gs/webui

WORKDIR /usr/src/open5gs/webui
RUN npm clean-install && \
    npm run build

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

CMD /wait && npm run dev

EXPOSE 9999