#!/bin/bash
# List Docker networks
docker network ls

# Inspect a Docker network
docker network inspect bridge

# Maak twee Docker-netwerken
docker network create mijn__prachtige_netwerk1
docker network create mijn__prachtige_netwerk2

# Start de eerste busybox-container in het eerste netwerk
docker run --network=mijn__prachtige_netwerk1 --name=busybox1 -d busybox sleep 3600

# Start de tweede busybox-container in het tweede netwerk
docker run --network=mijn__prachtige_netwerk2 --name=busybox2 -d busybox sleep 3600

# Controleer de netwerkdetails van de eerste container
docker inspect busybox1

# Controleer de netwerkdetails van de tweede container
docker inspect busybox2

# Probeer vanuit de eerste container de tweede container te pingen (dit zou moeten mislukken)
docker exec busybox1 ping -c 4 busybox2 || echo "Ping mislukt zoals verwacht"

# Verbind de eerste container met het tweede netwerk
docker network connect mijn__prachtige_netwerk2 busybox1

# Probeer nu opnieuw vanuit de eerste container de tweede container te pingen (dit zou nu moeten werken)
docker exec busybox1 ping -c 4 busybox2 || echo "Ping mislukt"

# Verwijder de Docker-netwerken
docker network rm mijn__prachtige_netwerk1 mijn__prachtige_netwerk2
