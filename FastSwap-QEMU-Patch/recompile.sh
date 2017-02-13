#!/bin/bash
cd ./memflex-qemu-2.0.0
make
make install
mv /usr/local/bin/qemu* /usr/bin
