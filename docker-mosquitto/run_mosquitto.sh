#!/bin/sh
#docker pull eclipse-mosquitto
docker run --name mosquitto -it --rm --network host eclipse-mosquitto
