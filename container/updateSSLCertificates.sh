#!/bin/bash
certbot certonly --force-renewal --server https://acme-v02.api.letsencrypt.org/directory -d www.openmaps.me -w /application/htdocs/ --authenticator webroot
certbot certonly --force-renewal --server https://acme-v02.api.letsencrypt.org/directory -d openmaps.me -w /application/htdocs/ --authenticator webroot
