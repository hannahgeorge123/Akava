# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# ─────────────────────────────────────────────
# Basic setup
# ─────────────────────────────────────────────
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# ─────────────────────────────────────────────
# (Optional) Language runtimes
# Uncomment what you need
# ─────────────────────────────────────────────

# Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs

# Python
RUN apt-get update && apt-get install -y python3 python3-pip

# ─────────────────────────────────────────────
# Install dependencies (optional)
# COPY requirements.txt ./requirements.txt
# RUN pip install -r requirements.txt
#
 # COPY package.json package-lock.json ./
# RUN npm ci
# ─────────────────────────────────────────────


# Keep container alive for dev
CMD ["bash"]
