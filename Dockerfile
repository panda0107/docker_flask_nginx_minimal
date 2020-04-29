# Alpine is a minimal linux image good for fast builds
FROM alpine:3

# Install nginx, python, and supervisor
RUN apk add --no-cache nginx python3 supervisor

# add our nginx configuration to the right place


# nginx needs this directory on alpine
RUN mkdir -p /run/nginx

# switch to the app directory
WORKDIR /app

# put python requirements into the app directory and build
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

# put everything else into the app directory. Do this at the end to take advantage of caching the previous steps which are less likely to change
COPY . ./

RUN rm /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/


# run the supervisord command. The reason we use supervisord is that a docker container can only have one entry point so to run multiple processes, we need something to launch and manage them
CMD ["supervisord", "-c", "supervisord.conf"]
