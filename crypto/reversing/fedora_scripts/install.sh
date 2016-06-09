#!/bin/sh

# Required to deal with vermagic incompatibility
# Jipsam should be okay as long as you use fc9

mkdir /lib/modules/`uname -r`/nkcrypto
cp *.ko /lib/modules/`uname -r`/nkcrypto
/sbin/depmod -a
