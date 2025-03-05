FROM base:v2.7.2 AS builder
FROM mongo:4.4.10

# install dependencies
RUN apt-get update && apt-get install vim wget -y
RUN wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | tee /etc/apt/trusted.gpg.d/server-7.0.asc \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list 
RUN apt-get install -y mongodb-mongosh

# Copy script from misc 
COPY --from=builder /open5gs/misc/db/open5gs-dbctl ./
RUN chmod 700 open5gs-dbctl