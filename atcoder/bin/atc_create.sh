#!/bin/bash

base=$HOME/gh/exam/atcoder

probname=$1
probsec=$2

if [ "$probname" == "" -o "$probsec" == "" ]; then
    echo "atc_create.sh [probrem name] [section]"
    exit 1
fi

mkdir -p $base/$probname/$probsec
cp $base/templ.cpp $base/$probname/$probsec/$probsec.cpp
touch $base/$probname/$probsec/$probsec.txt

cat > $base/$probname/$probsec/Makefile <<EOF
CXXFLAGS := -g -Wall -Wextra -pedantic -std=c++14
CC := g++

all: $probsec

$probsec: $probsec.o

$probsec.o: $probsec.cpp

clean:
	rm -f $probsec.o $probsec

EOF
