FROM debian:trixie-slim

COPY --from=amacneli/dbmate /usr/local/bin/dbmate /dbmate

WORKDIR /migrator

COPY db db

RUN ["/dbmate", "up"]
