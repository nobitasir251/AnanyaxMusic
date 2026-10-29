
FROM nikolaik/python-nodejs:python3.10-nodejs19

WORKDIR /app

# Install FFmpeg
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy bot source code
COPY . /app/

# Install Python dependencies
RUN python3 -m pip install --no-cache-dir -U pip \
    && python3 -m pip install --no-cache-dir -r requirements.txt

# Start the music bot
CMD ["bash", "start"]
