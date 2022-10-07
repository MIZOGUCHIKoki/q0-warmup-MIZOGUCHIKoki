#!/bin/bash

nasm $1.s
ld $1.o
./a.out
echo $?
rm $1.o
rm ./a.out
