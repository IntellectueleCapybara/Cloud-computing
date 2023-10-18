#!/bin/bash
# List Docker networks
docker network ls

# Inspect a Docker network
docker network inspect bridge

# Create a Docker network
docker network create mijn__prachtige_netwerk

# Connect a container to a Docker network
docker network connect mijn__prachtige_netwerk my_container

# Disconnect a container from a Docker network
docker network disconnect mijn__prachtige_netwerk my_container

# Remove a Docker network
docker network rm mijn__prachtige_netwerk


### DIT moet nog aangepas worden!!!
