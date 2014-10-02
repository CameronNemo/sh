shell-scripts
=============

Just some convenience shell scripts I occasionally use

#mkswap.sh

Creates a swapfile in the location /swapfile (beware on small roots!).
Will autodetect ram size and choose that for swap size, unless you explicitly set the swap size.

#flashcards.sh

Parses a plaintext file (two+ columns, word on column one, definition on rest of columns).
You say whether you knew the word (after or before seeing the definition) by typing in "y" and pressing enter.
Words you did not know (type in anything or nothing, then press enter) will be added to the list for the next round.
At the end, it tells you how many rounds it took to get through the entire list.
