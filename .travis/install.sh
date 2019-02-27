#!/bin/bash

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
    sudo apt-get update;
    sudo apt-get install -y build-essential python3-dev libdbus-1-dev libdbus-glib-1-dev libgirepository1.0-dev;
    pip install -r requirements_linux.txt
fi

if [ "$TRAVIS_OS_NAME" == "osx" ]; then
    brew update
    # see https://github.com/pyenv/pyenv/wiki#suggested-build-environment for Mac OS X
    brew install openssl readline sqlite3 xz zlib
    # pyenv is already installed on a test node
    brew outdated pyenv || brew upgrade pyenv
    pyenv install --list
    pyenv install $PYTHON
    pyenv shell $PYTHON
    python --version
    python3 --version
    pip --version
    pip3 --version
    pip3 install -r requirements_osx.txt
fi

if [ "$TRAVIS_OS_NAME" == "windows" ]; then
    choco install python3 --params "/Python3:C:\Python3"
    export PATH="/c/Python3:/c/Python3/Scripts:$PATH"
    python3 --version
    pip3 --version
fi

