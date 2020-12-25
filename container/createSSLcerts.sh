#!/bin/bash
letsencrypt certonly -a webroot --webroot-path=/application/htdocs/ -d openmaps.me -d www.openmaps.me
