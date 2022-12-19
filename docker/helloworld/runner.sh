#!/bin/sh

# Replace the hostname in the container
sed -i.bak 's/HOSTNAME/'"$HOSTNAME"'/g' /www/data/index.html

# Startup the cmd
# For to a container don't stop his live
exec "$@"
