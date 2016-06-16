#!/bin/bash

sudo docker stop esp
sudo docker rm esp
sudo docker build -t esp .
sudo docker run --name esp -d -p 8266:80 -v /home/paul/docker/DockerESP/ESP:/var/www/ESP/public_html/ esp
