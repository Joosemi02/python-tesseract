# Base Python yolk (choose version you want)
FROM ghcr.io/ptero-eggs/yolks:python_3.12

# Switch to root to install system packages
USER root

# Install Tesseract OCR + dependencies
RUN apt update && \
    apt install -y --no-install-recommends \
        tesseract-ocr \
        libtesseract-dev \
        ca-certificates \
        curl \
        wget && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to Pterodactyl runtime user
USER container
