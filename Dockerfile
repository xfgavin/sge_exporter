FROM debian:buster-slim
RUN apt-get -qq update >/dev/null 2>&1 && apt-get -qq install musl cpp libmunge2 libssl1.1 libjemalloc2 libbsd0 libevent-2.1-6 libgnutls-dane0 liblockfile-bin liblockfile1 libunbound8 netbase >/dev/null 2>&1 && apt-get -qq clean >/dev/null 2>&1 && apt-get -qq autoclean >/dev/null 2>&1 && ln -s ld-musl-x86_64.so.1 /lib/libc.musl-x86_64.so.1 && rm -rf /var/lib/apt/lists/*
COPY ./gridengine_exporter /usr/local/bin/
ENTRYPOINT /usr/local/bin/gridengine_exporter
