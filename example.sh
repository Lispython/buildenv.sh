#!/bin/sh

# example.sh
# ~~~~~~~~~~

# Buildenv.sh example

# :copyright: (c) 2013 by Alexandr Lispython (alex@obout.ru).
# :license: BSD, see LICENSE for more details.
# :github: http://github.com/Lispython/buildenv.sh


PYTHON_VERSION="python2.6"
VENV_PATH="./venv"
JS_REQ_FILE="./js-req.txt"


if [ ! -d "./buildenv/" ]; then
    git clone https://github.com/Lispython/buildenv.sh.git buildenv
else
    cd buildenv && git pull && cd ..
fi


. ./buildenv.sh

