#!/bin/bash

MQTT_HOST="localhost"
MQTT_PORT=1883
MQTT_TOPIC="/data"
MQTT_USERNAME="saurabh"
MQTT_PASSWORD="saurabh"
OUTPUT_FILE="received_messages.txt"

while read -r message; do
    timestamp=$(date)
    echo "$timestamp - $message" >> "$OUTPUT_FILE"
done < <(mosquitto_sub -h $MQTT_HOST -p $MQTT_PORT -t $MQTT_TOPIC -u $MQTT_USERNAME -P $MQTT_PASSWORD -q 1 -c -i saurabh)
