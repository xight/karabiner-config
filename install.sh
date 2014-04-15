#!/bin/bash

# relink target-file source-file
relink() {
	if [[ -h "$1" ]]; then
		echo "Relinking $1"
		# Symbolic link? Then recreate.
		rm "$1"
		ln -sn "$2" "$1"
	elif [[ ! -e "$1" ]]; then
		echo "Linking $1 to $2"
		ln -sn "$2" "$1"
	else
		echo "$1 exists as a real file, skipping."
	fi
}

DIR=$( cd "$( dirname "$0" )" && pwd )

IFS=\

KEYREMAP4MACBOOK_ROOT="$HOME/Library/Application Support/KeyRemap4MacBook"
mv $KEYREMAP4MACBOOK_ROOT/private.xml $KEYREMAP4MACBOOK_ROOT/private.xml.bak

echo 'install start'
relink $KEYREMAP4MACBOOK_ROOT/private.xml $DIR/private.xml
echo "done"
