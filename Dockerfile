FROM eclipse-mosquitto:2.0

# Copy the template file
COPY mosquitto.conf.template /mosquitto/config/mosquitto.conf.template

# Use envsubst to replace ${PORT} at runtime
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["envsubst < /mosquitto/config/mosquitto.conf.template > /mosquitto/config/mosquitto.conf && mosquitto -c /mosquitto/config/mosquitto.conf"]
