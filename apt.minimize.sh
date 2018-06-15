#!/bin/sh

apt autoremove --purge
apt clean
lists_dir="/var/lib/apt/lists"
rm -f $lists_dir/archive.*
rm -f $lists_dir/security.*
