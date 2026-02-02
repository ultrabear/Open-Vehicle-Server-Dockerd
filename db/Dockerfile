FROM debian:trixie-slim

COPY --from=amacneil/dbmate /usr/local/bin/dbmate /dbmate

WORKDIR /migrator

COPY . db

CMD ["/dbmate", "up"]
