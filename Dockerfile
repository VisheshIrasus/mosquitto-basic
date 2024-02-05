FROM eclipse-mosquitto

# Install Bash
RUN apk update && \
    apk add --no-cache bash

EXPOSE 1883
RUN touch /mosquitto/passwordfile
RUN mosquitto_passwd -b /mosquitto/passwordfile saurabh saurabh
RUN chown root /mosquitto/passwordfile
RUN chmod 0700 /mosquitto/passwordfile

# Copy all .sh files from the current directory to the root directory
COPY ./*.sh /

# Change permissions to make them executable
RUN chmod +x /*.sh

RUN touch received_messages.txt
# ENTRYPOINT ["/docker-entrypoint.sh"]
# CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]