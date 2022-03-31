#! /bin/bash

CC=/usr/bin/gcc
FLAG1=-Wall
FLAG2=-Werror
FLAG3=-std=c99
FLAG4=-pedantic
CFile_Directory=src


echo "CC="$CC > Makefile.rules
echo "FLAGS="$FLAG1 $FLAG2 $FLAG3 $FLAG4 >> Makefile.rules
echo "CFile_Directory="$CFile_Directory"/" >> Makefile.rules
