# HyperBEAM Docker

HyperBEAM Docker is a Docker image built by p10node to quickly launch a HyperBEAM node. With just a single Docker command, you can get started without having to install any complex dependencies.

### TLDR;

```bash
tee wallet.json >/dev/null << EOF
<your wallet content>
EOF

docker run -d -v ./wallet.json:/app/wallet.json --name hb -p 8080:8080 p10node/arweave-hb:latest
```

### Hardware Requirement

- CPU: 2+ cores recommended
- RAM: 4GB minimum, 8GB+ recommended
- Storage: 10GB free space for the Docker image and data
- Network: Stable internet connection

### What're included?

- Erlang 27
- Rebar3
- NodeJS
- Rust
- HyperBEAM node

### Size

- [p10node/arweave-hb-system](https://hub.docker.com/r/p10node/arweave-hb-system) `685.9 MB`
- [p10node/arweave-hb](https://hub.docker.com/r/p10node/arweave-hb) `1.2 GB`

### Run as Docker

```bash
docker run -d -v ./wallet.json:/app/wallet.json --name hb -p 8080:8080 p10node/arweave-hb:latest
```

#### Custom Ports

```bash
CUSTOM_PORT=10000
docker run -d -v ./wallet.json:/app/wallet.json --name hb -p $CUSTOM_PORT:8080 p10node/arweave-hb:latest
```

## Custom Options

Clone this repo, custom `config.flat`, `Dockerfile`, then `rebuild`

```bash
make rebuild
```

## Stop the node

```bash
make stop

# or 

docker stop hb
docker rm hb
```

# License

MIT
