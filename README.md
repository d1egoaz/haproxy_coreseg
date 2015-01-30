## Simple docker image with haproxy with https support.

Reverse proxy https requests to http request to the backend. HAPROXY SSL termination.

haproxy --> backend
![alt tag](https://assets.digitalocean.com/articles/HAProxy/ssl/haproxy_ssl.png)

The request is:
 GET /conceptos/conceptos_API/foo
but it should be seen by the real server as /conceptos_API/foo

```
  reqirep ^([^\ ]*)\ /conceptos/([^\ ]*)\ (.*)$       \1\ /\2\ \3
```

Requesto to haproxy -->  Request to backend with url rewrite, is like apache ProxyPass
https://loadbalancer/conceptos/conceptos_API/foo --> http://server:port/conceptos_API/foo


### Running

The server that haproxy redirects can be parametrized in the run command of docker, with the option --add-host
In haproxy the server dev.suranet.com is referenced, but the real ip is pass as reference in the run command, so, it can be any address.

In this example 172.17.42.1 is my local machine.


```
docker run \
  --add-host='dev.suranet.com:172.17.42.1' \
  -p 80:80 \
  -p 443:443 \
  -p 8080:8080 \
  d1egoaz/haproxycoreseg

```

## References
- [haproxy ssl termination](https://www.digitalocean.com/community/tutorials/how-to-implement-ssl-termination-with-haproxy-on-ubuntu-14-04)
