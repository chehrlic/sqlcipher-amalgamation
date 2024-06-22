#!/bin/sh

version=v4.6.0

rm -rf sqlcipher
git clone https://github.com/sqlcipher/sqlcipher.git --branch $version --single-branch 
cd sqlcipher
./configure --with-crypto-lib=none
make sqlite3.c
cp sqlite3.c ..
cp sqlite3.h ..
cp sqlite3ext.h ..
cp VERSION ..
cd ..
rm -rf sqlcipher

echo "SQLCiper version: $version" >> VERSION
git add sqlite3.c sqlite3.h sqlite3ext.h VERSION
git commit -m "Add sqlcipher-amalgamation $version"

