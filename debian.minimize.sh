#!/bin/sh

set -e

which apt.minimize.sh >/dev/null 2>&1 && apt.minimize.sh || true

test ! -f /etc/locale.gen || . /etc/locale.gen
test ! -f /etc/default/locale || . /etc/default/locale
test -z "$LANG" || excl_arg="! -name $(echo ${LANG} | cut -d_ -f1)*"

find /usr/share/locale -mindepth 1 -maxdepth 1 \
	"$locale_excl" ! -name "locale.alias" | xargs rm -rf || true

find /usr/share/doc -depth -type f ! -name copyright | xargs rm -f || true
find /usr/share/doc -empty | xargs rm -rf || true

rm -rf /var/cache/man/*
rm -rf /usr/share/man/*
rm -rf /usr/share/info/*
rm -rf /usr/share/groff/*
rm -rf /usr/share/linda/*
rm -rf /usr/share/lintian/*
