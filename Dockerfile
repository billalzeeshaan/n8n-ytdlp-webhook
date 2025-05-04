FROM n8nio/n8n:latest

USER root

# Install dependencies: Python, pip, and ffmpeg
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip3 install --no-cache-dir yt-dlp

USER node

EXPOSE 5678

CMD ["n8n", "start", "--tunnel"]
