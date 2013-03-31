buildenv.sh
===========

buildenv.sh is a small sh/bash script that help to install
python virtualenv and node virtualenv.


Usage
-----

Add buildenv.sh as submodule for you project::

  git submodule add https://github.com/Lispython/buildenv.sh.git buildenv

Create in you project root sh/bash script (such as ``env.sh``) with a similar content::

  . ./buildenv/buildenv.sh


also you can specify variables before ``buildenv.sh`` include::

  PYTHON_VERSION="python2.7" # Spefied python version
  VENV_PATH="./venv" # Specified virtualenv location
  JS_REQ_FILE="./js-req.txt" # Specified node requirements file
  REQ_FILE="req.txt" # Specified python prod requirements file
  DEV_REQ_FILE="dev-req.txt" # Specified development requirements file
  JS_ENV_JOBS=10 # Nodeenv jobs

  . ./buildenv/buildenv.sh


Build virtualenv by command::

  ./env.sh js

or::
  ./env.sh dev_py


CONTRIBUTE
----------

#. Check for open issues or open a fresh issue to start a discussion around a feature idea or a bug.
   There is a Contributor Friendly tag for issues that should be ideal for people who are not very familiar with the codebase yet.
#. Fork `the repository`_ on Github to start making your changes to the **develop** branch (or branch off of it).
#. Write a test which shows that the bug was fixed or that the feature works as expected.
#. Send a pull request and bug the maintainer until it gets merged and published.

.. _`the repository`: https://github.com/Lispython/buildenv.sh
