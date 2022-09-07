#!/bin/sh
find "$1" -name 'obj' -type d -o \
-name 'bin' -type d -o \
-name 'packages' -type d -o \
-name 'TestResults' -type d | xargs rm -rf
