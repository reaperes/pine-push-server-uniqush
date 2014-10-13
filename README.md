Pine push server uniqush
=========================

This project based on Uniqush-push - Apache license 2.0. (http://uniqush.org/)

Installation
-------------
Install docker (http://docs.docker.com/installation/ubuntulinux/)

Pre-Run
----
    1. docker run -it \
                  -p 8520:8520 \
                  reaperes/pine-push-server-uniqush \
                  bin/bash
    2. wget $apns_certification

You can tail the logs using `docker logs -f $container_id`
