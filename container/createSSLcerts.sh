#!/bin/bash
letsencrypt certonly -a webroot --webroot-path=/application/htdocs/ -d www.openmaps.me
letsencrypt certonly -a webroot --webroot-path=/application/htdocs/ -d openmaps.me
