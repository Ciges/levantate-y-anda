#!/bin/sh
#docker pull eclipse-mosquitto
docker run --rm --name mosquitto -it --network host --mount type=bind,source="$PWD/mosquitto",target=/mosquitto eclipse-mosquitto
