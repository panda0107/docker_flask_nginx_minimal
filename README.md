# Flask, Nginx, & Docker minimal example

A minimal example of a docker container running both flask and nginx. Supervisord is required to manage them both since docker only allows for one entrypoint / cmd. The code is well commented.

#### Why?
For performance reasons, Python should not serve static files. The usual way to manage this is to run multiple containers or setup a good CDN. A good CDN is not always enough and I believe that running an entire application in a single container is simpler and more maintainable that trying to manage multiple containers of different types. I built this in the hope that others might find it useful.

To build:

    docker build --tag minimal_server_image .

To run:

    docker run --rm --publish 8888:80 --name minimal_server_container -t -i minimal_server_image

To view

    Go to http://localhost:8888 in your browser

*Globe gif is courtesy NASA*
