# sh

shell scripts: routine operations, useful utilities, and a flashcard game

Compiling (heh) :

    chmod +x *.sh

Installing:

    install -o root -g root *.sh /usr/local/bin

Invocation:

    apt.minimize.sh
    debian.minimize.sh
    mkswap.sh
    flashcards.sh
    xhost.root.sh [off]

## apt.minimize.sh

a tool to decrease the footprint of an apt/dpkg installation

removes apt/dpkg related files that can be redownloaded and are thus extraneous

used in debian family containers to cut down on disk space usage

## debian.minimize.sh

removes documentation and locale files on a debian system

optionally excludes the locale specified in `/etc/default/locale` or `/etc/locale.gen` (with the `$LANG` variable)

## mkswap.sh

creates a swapfile at `/swapfile`

this tool will detect ram size and choose that for swap size, unless you explicitly set the swap size

take caution if your root partition is small and your ram is large

## flashcards.sh

Parses a plaintext file (two+ columns, word on column one, definition on rest of columns).  
You say whether you knew the word (after or before seeing the definition) by typing in "y" and pressing enter.  
Words you did not know (type in anything or nothing, then press enter) will be added to the list for the next round.  
At the end, it tells you how many rounds it took to get through the entire list.

## xhost.root.sh

This will allow root applications to run on XWayland (e.g. gparted). It sets access control lists to permit local root users. Invoking the program with the `off` argument will undo the ACL change.
