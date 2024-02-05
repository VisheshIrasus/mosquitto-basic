```
mosquitto_pub -h localhost -p 1883 -t /data -m "Hello Saurabh, $(date)" -u saurabh -P saurabh

mosquitto_sub -h localhost -p 1883 -t /data -u saurabh -P saurabh
```


## publisher
```
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
```


## subscriber
```
#!/bin/bash

MQTT_HOST="localhost"
MQTT_PORT=1883
MQTT_TOPIC="/data"
MQTT_USERNAME="saurabh"
MQTT_PASSWORD="saurabh"
OUTPUT_FILE="received_messages.txt"

touch "$OUTPUT_FILE"

while read -r message; do
    timestamp=$(date)
    echo "$timestamp - $message" >> "$OUTPUT_FILE"
done < <(mosquitto_sub -h $MQTT_HOST -p $MQTT_PORT -t $MQTT_TOPIC -u $MQTT_USERNAME -P $MQTT_PASSWORD)
```


mosquitto_sub -h "localhost" -p 1883 -t "/data" -u "saurabh" -P "saurabh" -q 1 -c -i "saurabh"
```
sudo docker exec -it mosquitto sh
```