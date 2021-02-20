#!/bin/sh
#docker pull eclipse-mosquitto
docker run --name mosquitto -it -d --network host --mount type=bind,source="$PWD/mosquitto",target=/mosquitto eclipse-mosquitto
