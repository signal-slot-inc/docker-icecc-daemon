FROM alpine:3.14

RUN apk --no-cache add libcap-ng lzo libstdc++ zstd libarchive gcc g++ bash file && \
    apk --no-cache add --virtual .bdeps alpine-sdk git automake autoconf libtool libcap-ng-dev lzo-dev zstd-dev libarchive-dev && \
    git clone https://github.com/icecc/icecream && \
    (cd icecream && autoreconf -i && ./configure --without-man && make -j`nproc` && make install) && \
    rm -rf icecream && \
    apk del .bdeps

# Run icecc daemon in verbose mode by default
CMD ["iceccd","-vv"]

# iceccd port
EXPOSE 10245

# icecc-scheduler port
EXPOSE 8765/TCP 8765/UDP

