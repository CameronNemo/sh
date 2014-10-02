#! /bin/sh

LIST="$1"

test -n "$LIST" || { echo "need to have list file as arg1"; exit 1; }
test -r $LIST || { echo "list not readable"; exit 1; }

WORDS="$(awk '{ print $1 }' $LIST)"

ROUND=0

while test -n "$WORDS"; do
	ROUND=$(($ROUND + 1))
	echo
	echo "ROUND $ROUND!"
	echo
	NEWWORDS=""
	for word in $WORDS; do
		echo Word: $word
		echo -n "correct? "
		read arg
		test "$arg" = "y" && continue
		echo Definition: $(awk -v word=$word '{ if ($1 == word) print substr($0, index($0,$2)) }' $LIST)
		echo -n "correct? "
		read arg
		test "$arg" = "y" && continue
		NEWWORDS="$NEWWORDS $word"
	done
	WORDS="$NEWWORDS"
done

echo
echo "Rounds to finish: $ROUND"
