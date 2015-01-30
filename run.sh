docker run \
  --add-host='dev.suranet.com:172.17.42.1' \
  -p 80:80 \
  -p 443:443 \
  -p 8080:8080 \
  d1egoaz/haproxycoreseg
