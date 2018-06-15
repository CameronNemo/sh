#!/bin/sh

set -e

apt autoremove --purge || true
apt clean || true

rm -f /var/log/apt/*
rm -f /var/log/dpkg.log

rm -f /var/cache/debconf/*-old

rm -rf /var/lib/apt/lists/*
mkdir -p /var/lib/apt/lists/partial
