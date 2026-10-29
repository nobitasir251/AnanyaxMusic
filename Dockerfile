FROM nikolaik/python-nodejs:python3.10-nodejs22-bookworm

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN python3 -m pip install --no-cache-dir -r requirements.txt

CMD ["bash", "start"]
