FROM ubuntu:22.04

# Install prerequisites
RUN apt-get update && \
    apt-get install -y curl unzip jq net-tools logrotate dnsutils ufw

# Install OpenSSL 3 (if not already included in Ubuntu 22.04)
RUN apt-get install -y openssl=3.0.*

# Download and run the Dusk installer script
RUN curl --proto '=https' --tlsv1.2 -sSfL https://github.com/dusk-network/node-installer/releases/download/v0.3.5/node-installer.sh | sh

# Expose necessary ports
EXPOSE 8080 9000

# Set entrypoint
ENTRYPOINT ["service", "rusk", "start"]