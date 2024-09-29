############################
# STEP 1: Build executable binary
############################
FROM golang:alpine AS builder

# Install dependencies
RUN apk update && apk add --no-cache git bash wget curl

# Set working directory
WORKDIR /build

# Clone the repository and build V2Ray
RUN git clone --progress https://github.com/hf6420/v2ray-core.git . && \
    bash ./release/user-package.sh nosource noconf codename=$(git describe --abbrev=0 --tags) buildname=docker-fly abpathtgz=/tmp/v2ray.tgz

############################
# STEP 2: Build a small image
############################
FROM alpine:3.15.11

# Set the maintainer label
LABEL maintainer="V2Fly Community <hf@v2fly.org>"

# Copy the V2Ray package from the builder stage
COPY --from=builder /tmp/v2ray.tgz /tmp

# Install CA certificates and extract V2Ray
RUN apk update && apk add --no-cache ca-certificates && \
    mkdir -p /usr/bin/v2ray && \
    tar xvfz /tmp/v2ray.tgz -C /usr/bin/v2ray && \
    rm /tmp/v2ray.tgz  # Clean up to save space

# Set up the volume for configuration
VOLUME ["/etc/v2ray"]

# Set environment variables
ENV PATH="/usr/bin/v2ray:$PATH" \
    TZ="Asia/Shanghai"

# Set the entry point and command
ENTRYPOINT ["/usr/bin/v2ray/v2ray"]
CMD ["run", "-config", "/etc/v2ray/config.json"]
