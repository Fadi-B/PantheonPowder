#!/bin/sh

cd pantheon

sudo sysctl -w net.ipv4.ip_forward=1

cd src/wrappers/

chmod 755 sprout-ewma.py
chmod 755 sprout-ma.py
chmod 755 sprout-sewma.py
chmod 755 sprout-oracle.py
chmod 755 sprout-fadi.py

cd ..
cd ..

chmod -R 755 third_party/sprout-ewma/
chmod -R 755 third_party/sprout-ma/
chmod -R 755 third_party/sprout-sewma/
chmod -R 755 third_party/sprout-oracle/
chmod -R 755 third_party/sprout-fadi/

#Might want to consider downloading this package in the actual setup pantheon script
#Note: Eigen is header based and so there is no need to compile anything

mkdir third_party/sprout-fadi/src/extern_utils

cd third_party/sprout-fadi/src/extern_utils
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar
tar -xvf eigen-3.3.9.tar

cd ../../../../

src/experiments/setup.py --schemes "cubic sprout vivace verus copa"
