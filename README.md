## Simple docker image with haproxy with https support.

Reverse proxy https request to http request to the backend.

haproxy --> backend


The request is:
 GET /conceptos/conceptos_API/foo
but it should be seen by the real server as /conceptos_API/foo

```
  reqirep ^([^\ ]*)\ /conceptos/([^\ ]*)\ (.*)$       \1\ /\2\ \3
```

* Requesto to haproxy
https://loadbalancer/conceptos/conceptos_API/foo  

-->  

* Request to backend with url rewrite, is like apache ProxyPass
http://server:port/conceptos_API/foo


### Running

The server that haproxy redirects can be parametrized in the run command of docker, with the option --add-host

docker run \
  --add-host='dev.suranet.com:172.17.42.1' \
  -p 80:80 \
  -p 443:443 \
  -p 8080:8080 \
  d1egoaz/haproxycoreseg

