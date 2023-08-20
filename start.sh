#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

nano /etc/ssh/sshd_config

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log
