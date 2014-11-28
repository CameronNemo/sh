#! /bin/sh

LIST="$1"

test -n "$LIST" || { echo "need to have list file as arg1"; exit 1; }
test -r $LIST || { echo "list not readable"; exit 1; }

WORDS="$(awk -F"\t*" '{ print $1 }' $LIST)"

ROUND=0

OLDIFS="$IFS"
IFS="
"

while test -n "$WORDS"; do
	ROUND=$(($ROUND + 1))
	echo
	echo "ROUND $ROUND!"
	echo
	NEWWORDS=""
	for word in $WORDS; do
		echo Word: $word
		echo -n "correct [y/N] ? "
		read arg
		test "$arg" = "y" && continue

		echo Definition: $(awk -F "\t*" -v word="$word" '{ if ($1 == word) print $2 }' $LIST)
		echo -n "correct [y/N] ? "

		read arg
		test "$arg" = "y" && continue

		NEWWORDS="$NEWWORDS
$word"
	done
	WORDS="$NEWWORDS"
done

IFS="$OLDIFS"

echo
echo "Rounds it took to finish: $ROUND"
