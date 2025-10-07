FROM p10node/arweave-hb-system:latest

ARG HYPERBEAM_HASH=d58f16b806f3e54e528624a3f6c0c81e34160ba6
ENV HYPERBEAM_PATH=/app/HyperBEAM

WORKDIR ${HYPERBEAM_PATH}

RUN cd /app && \
    git clone https://github.com/permaweb/HyperBEAM.git && \
    cd HyperBEAM && \
    git checkout ${HYPERBEAM_HASH}

COPY config.flat ${HYPERBEAM_PATH}/config.flat
COPY config.flat ${HYPERBEAM_PATH}/_build/default/rel/hb/config.flat

RUN cd ${HYPERBEAM_PATH} && rebar3 release

RUN ln -s /app/wallet.json ${HYPERBEAM_PATH}/_build/default/rel/hb/hyperbeam-key.json

CMD ["sh", "-c", "${HYPERBEAM_PATH}/_build/default/rel/hb/bin/hb foreground"]
