#!/bin/bash

sed -i "s|{{TRUSTED_HOST}}|${TRUSTED_HOST}|" /etc/foreman-proxy/settings.yml
sed -i "s|{{FOREMAN_URL}}|${FOREMAN_URL}|" /etc/foreman-proxy/settings.yml
sed -i "s|{{AWS_KEYID}}|$AWS_KEYID}|" /etc/foreman-proxy/settings.d/dns_route53.yml
sed -i "s|{{AWS_KEY}}|$AWS_KEY}|" /etc/foreman-proxy/settings.d/dns_route53.yml

/usr/share/foreman-proxy/bin/smart-proxy

