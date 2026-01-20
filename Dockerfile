FROM debian:trixie-slim

RUN apt update && \
 apt install -y wget curl perl make cpanminus gcc 'libmariadb-dev-compat'

RUN apt install -y 'libdbd-mysql-perl'

ENV PERL_CPANM_OPT="--from https://cpan.metacpan.org/"

WORKDIR /ovms/
COPY cpanfile .

RUN cpanm --installdeps . --notest


COPY . .

# makes config dir accessible from /config for ease of use
RUN \
 rm /ovms/v3/server/conf -r && \
 mkdir /config && \
 ln -s /config /ovms/v3/server/conf


 WORKDIR /ovms/v3/server/


 CMD ["perl", "ovms_server.pl"]
