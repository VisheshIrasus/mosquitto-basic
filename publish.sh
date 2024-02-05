#!/bin/bash

MQTT_HOST="localhost"
MQTT_PORT=1883
MQTT_TOPIC="/data"
MQTT_USERNAME="saurabh"
MQTT_PASSWORD="saurabh"

counter=0

while true; do
    timestamp=$(date)
    ((counter++))
    message="Hello Saurabh $timestamp - Counter: $counter"
    mosquitto_pub -h $MQTT_HOST -p $MQTT_PORT -t $MQTT_TOPIC -q 1 -m "$message" -u $MQTT_USERNAME -P $MQTT_PASSWORD
done
