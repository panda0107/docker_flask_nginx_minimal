# Flask, Nginx, & Docker minimal example

A minimal example of a docker container running both flask and nginx together. Flask is setup as a dynamic webserver and nginx is setup for static file hosting. Taking the burden off of python to serve static files is important for performance. Supervisord is used to manage them. The code is commented.

To build:

    docker build --tag minimal_server_image .

To run:

    docker run --rm --publish 8888:80 --name minimal_server_container -t -i minimal_server_image

To view

    Go to http://localhost:8888 in your browser

*Globe gif is courtesy NASA*
