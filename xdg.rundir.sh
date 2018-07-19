#!/bin/sh

set -e

function rundir() {
	local uid="$(id -u $1)"
	local gid="$(id -g $1)"
	local dir="/run/user/${uid}/"
	test -n "$uid" && test -n "$gid"
	install -m 0750 -o "$uid" -g "$gid" -d "$dir"
	mount -t tmpfs -o nosuid,noexec,nodev,uid="$uid",gid="$gid",size=10%,mode=750 tmpfs "$dir"
}

function usage() {
	echo "Usage: $(basename $0) USER"
	exit 1
}

test -n "$1" || usage

rundir "$1"
