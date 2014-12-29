#!/bin/sh

set -e

usage() {
	echo "Usage: mkswap.sh [-h | --help] [swap-size]"
	echo ""
	echo "	swap-size: explicitly set the size of swap (size of ram is used by default)"
}

case $1 in
	-h|--help) { usage; exit 0; };;
	*) swap_size="$1" ;;
esac

get_ram_size() {
	test -r /proc/meminfo || { echo "ERROR: /proc/meminfo not readable, could not determine RAM size"; exit 1; }
	local ram=$(awk '{ if ($1 == "MemTotal:") print $2 };' /proc/meminfo | head -n1)
	test -n "$ram" || { echo "ERROR: could not determine RAM size"; exit 1; }
	echo $ram
	return
}

test -z "$swap_size" && swap_size="$(get_ram_size)"

dd if=/dev/zero of=/swapfile bs=1024 count="$swap_size"

chmod 600 /swapfile

mkswap /swapfile

swapon /swapfile

echo "/swapfile	swap		swap	defaults	0	0" >> /etc/fstab
