FROM ubuntu:22.04

WORKDIR /app

# Install essential development packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  sudo build-essential cmake git pkg-config ncurses-dev libssl-dev \
  curl ca-certificates libncurses5-dev openssl autoconf gcc make g++ clang supervisor \
  zlib1g-dev unixodbc-dev wget \
  && rm -rf /var/lib/apt/lists/*

# ERLang@27
RUN git clone https://github.com/erlang/otp.git && \
  cd otp && git checkout maint-27 && \
  ./configure --without-wx --without-debugger --without-observer --without-et && \
  make -j$(nproc) && \
  make install && \
  cd .. && rm -rf otp

# Rebar3
RUN wget https://github.com/erlang/rebar3/releases/download/3.24.0/rebar3 && \
  chmod +x rebar3 && \
  mv rebar3 /usr/local/bin/

# NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
  apt install nodejs 

# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
