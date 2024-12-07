#!/bin/bash
# Check if .env file exists
if [ -e .env ]; then
    source .env
else
    echo "Please set up your .env file before starting your enviornment."
    exit 1
fi
mkdir -p ./ovpn-data
docker-compose run --rm server ovpn_genconfig -u $PROTO://$HOSTNAME:$PUBLIC_PORT
docker-compose run --rm server ovpn_initpki