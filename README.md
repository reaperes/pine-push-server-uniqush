Pine push server uniqush
=========================

This project based on Uniqush-push - Apache license 2.0. (http://uniqush.org/)

Installation
-------------
Install docker (http://docs.docker.com/installation/ubuntulinux/)

Run
----
    docker run -d \
               -p 8520:8520
               reaperes/docker-uniqush-push

You can tail the logs using `docker logs -f $container_id`
