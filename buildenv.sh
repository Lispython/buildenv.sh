#!/bin/sh

# buildenv.sh
# ~~~~~~~~~~

# Bash helpers for virtualenv creation

# :copyright: (c) 2013 by Alexandr Lispython (alex@obout.ru).
# :license: BSD, see LICENSE for more details.
# :github: http://github.com/Lispython/buildenv.sh


if [ ! $PYTHON_VERSION ]; then
    PYTHON_VERSION="python2.7"
fi


if [ ! $VENV_PATH ]; then
    VENV_PATH=../venv
fi

if [ ! $REQ_FILE ]; then
    REQ_FILE=../req.txt
fi

if [ ! $DEV_REQ_FILE ]; then
    DEV_REQ_FILE=../dev-req.txt
fi

if [ ! $JS_REQ_FILE ]; then
    JS_REQ_FILE=../js-req.txt
fi

if [ ! $JS_ENV_JOBS ]; then
    JS_ENV_JOBS=10
fi



empty_env(){
    curl https://raw.github.com/pypa/virtualenv/master/virtualenv.py > ./virtualenv.py
    if [ ! -d "$VENV_PATH/" ]; then
	echo "Virtualenv not exists, creating..."
	python ./virtualenv.py --python=$PYTHON_VERSION --clear $VENV_PATH
    else
	echo "Virtualenv exists"
    fi
    . $VENV_PATH/bin/activate
    $VENV_PATH/bin/easy_install pip
}

prod_py(){

    empty_env

    if [ -f $REQ_FILE ]; then
	$VENV_PATH/bin/pip install -U -r $REQ_FILE
    else
	echo "No requirements exists"
    fi
    python ./virtualenv.py --relocatable $VENV_PATH
}

dev_py(){
    empty_env
    prod_py

    if [ -f $DEV_REQ_FILE ]; then
	$VENV_PATH/bin/pip install -U -r ../dev_req.txt
    else
	echo "No dev requirements exists"
    fi
    python ./virtualenv.py --relocatable $VENV_PATH
}

js(){
    if [ ! -d "$VENV_PATH/" ]; then
	echo "Virtualenv not exists, creating..."
	prod_py
    fi

    if [ ! -f $VENV_PATH/bin/node ]; then
	echo "Node not found, installing ..."
	curl https://raw.github.com/ekalinin/nodeenv/e85a806e21d9bb5e417f1c17080964c485332b27/nodeenv.py > ./nodeenv.py
	python ./nodeenv.py --jobs=$JS_ENV_JOBS -p $VENV_PATH
    fi

    if [ -f $JS_REQ_FILE ]; then
	echo "Success"
	. $VENV_PATH/bin/activate
	cat "$JS_REQ_FILE" | awk '{ print "npm install -g "$1}' | sh
    else
	echo "No js requirements exists"
    fi
}


case $1 in
	"prod_py") prod_py;;

        "dev_py") dev_py;;

	"js") js;;

        "empty_env") empty_env;;

	*) empty_env;;
esac