FROM haproxy:1.5
MAINTAINER d1egoaz <diego.alvarez.zuluaga@gmail.com>
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY localhost.suranet.com.pem /etc/ssl/private/localhost.suranet.com.pem
EXPOSE 8080
EXPOSE 443
CMD ["haproxy", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
