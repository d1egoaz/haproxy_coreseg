#!/bin/bash

# Docker always give me the same ip, local server
DOCKER_HOST_IP="172.17.42.1"

# You could use a different ip x service
IPWEB=$DOCKER_HOST_IP
IPCONCEPTOS=$DOCKER_HOST_IP
IPGENERADOR=$DOCKER_HOST_IP
IPEJECUTOR=$DOCKER_HOST_IP
IPHOMOLOGADOR=$DOCKER_HOST_IP
IPINTEGRADOR=$DOCKER_HOST_IP

docker run \
  --add-host="dev-web.suranet.com:$IPWEB" \
  --add-host="dev-conceptos.suranet.com:$IPCONCEPTOS" \
  --add-host="dev-generador.suranet.com:$IPGENERADOR" \
  --add-host="dev-ejecutor.suranet.com:$IPEJECUTOR" \
  --add-host="dev-homologador.suranet.com:$IPHOMOLOGADOR" \
  --add-host="dev-integrador.suranet.com:$IPINTEGRADOR" \
  -p 80:80 \
  -p 443:443 \
  -p 8080:8080 \
  d1egoaz/haproxycoreseg
