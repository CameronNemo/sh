#!/bin/sh
test "$1" = "off" \
	&& exec xhost -SI:localuser:root \
	|| exec xhost +SI:localuser:root
