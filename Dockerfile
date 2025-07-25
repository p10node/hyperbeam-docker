FROM p10node/arweave-hb-system:latest

WORKDIR /app/HyperBEAM

# HyperBEAM
RUN cd /app && git clone https://github.com/permaweb/HyperBEAM.git

# Config
COPY config.flat /app/HyperBEAM/config.flat
COPY config.flat /app/HyperBEAM/_build/default/rel/hb/config.flat

# Build
RUN rebar3 release

# Wallet Path
RUN ln -s /app/wallet.json /app/HyperBEAM/_build/default/rel/hb/hyperbeam-key.json

CMD ["/app/HyperBEAM/_build/default/rel/hb/bin/hb", "foreground"]
