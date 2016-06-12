FROM ubuntu:14.04
MAINTAINER Ivan Onushkin

RUN wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add - \
    echo "deb http://deb.theforeman.org/ trusty 1.11" > /etc/apt/sources.list.d/foreman.list \
    echo "deb http://deb.theforeman.org/ plugins 1.11" >> /etc/apt/sources.list.d/foreman.list \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y foreman-proxy rubygems\
    mkdir -p /var/lib/puppet/ssl \
    rm -rf /etc/foreman-proxy/settings.d/* \
    gem install smart_proxy_dns_route53

EXPOSE 8443

COPY settings.yml /etc/foreman-proxy/
COPY dns.yml /etc/foreman-proxy/settings.d/
COPY dns_route53.yml /etc/foreman-proxy/settings.d/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
