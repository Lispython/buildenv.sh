#!/bin/sh

if [ ! -d "./.git/" ]; then
	curl -L https://raw.github.com/Lispython/buildenv.sh/master/buildenv.sh > ./buildenv.sh
	. ./buildenv.sh
else

	if [ ! -d "./buildenv/" ]; then

		git submodule add -b master https://github.com/Lispython/buildenv.sh.git buildenv
		cd buildenv && git checkout master && cd ..
	else
		cd buildenv && git checkout master && git pull && cd ..
	fi

	. ./buildenv/buildenv.sh
fi
