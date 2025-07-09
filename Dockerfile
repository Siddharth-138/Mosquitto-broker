FROM eclipse-mosquitto:2.0

# Install envsubst (needed to inject dynamic PORT)
RUN apk add --no-cache gettext

# Copy the template config
COPY mosquitto.conf.template /mosquitto/config/mosquitto.conf.template

# Replace ${PORT} at runtime and launch mosquitto
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["envsubst < /mosquitto/config/mosquitto.conf.template > /mosquitto/config/mosquitto.conf && mosquitto -c /mosquitto/config/mosquitto.conf"]
