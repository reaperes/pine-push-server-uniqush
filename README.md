Pine push server uniqush
=========================

This project based on Uniqush-push - Apache license 2.0. (http://uniqush.org/)

Installation
-------------
Install docker (http://docs.docker.com/installation/ubuntulinux/)

Run (Apns)
-----------
    1. docker run -it \
                  -p 8520:8520 \
                  reaperes/pine-push-server-uniqush \
                  /bin/bash
    2. wget /var/lib/docker/containers/$container_id/root/$apns_certification
    3. curl http://localhost:8520/addpsp \
            -d service=test \
            -d pushservicetype=apns \
            -d cert=/root/veil-cert.pem \
            -d key=/root/veil-key.pem \
            -d sandbox=true
    4. curl http://127.0.0.1:8520/subscribe \
            -d service=test \
            -d subscriber=test \
            -d pushservicetype=apns \
            -d devtoken=da78db0b57a7296af577bd2642a73225a48e5b519041946ef672e1b0fee13c1a
    5. curl http://127.0.0.1:8520/push \
            -d service=test \
            -d subscriber=test \
            -d msg="hello, apns"

Run (Gcm)
----------
    1. same above
    2. pass. gcm does not need require cert file
    3. curl http://localhost:8520/addpsp \
            -d service=test \
            -d pushservicetype=gcm \
            -d projectid=633680020112 \
            -d apikey=$api_key
    4. curl http://localhost:8520/subscribe \
            -d service=test \
            -d subscriber=namhoon \
            -d pushservicetype=gcm \
            -d regid=APA91bHcPxD-dSqk0qNu7RMSlBjO-DqJtcUzofa6dLU76IEArprvlfq7X82oHeIRNDxfyTOtYufnqHTTUBx4QS8U7ESaWpha2UGan2U06k9r1p-0x-cJrl22OpV0CMvs2cJq4KRreqtU_r8b-zIkNhys9phy0c7mpDVjA06if531VeIuJ5yQL6c
    5. curl http://localhost:8520/push \
            -d service=test \
            -d subscriber=namhoon \
            -d msg="hello, gcm"

You can tail the logs using `docker logs -f $container_id`
