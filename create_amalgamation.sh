#!/bin/sh

version=v4.6.1
echo Building SQLCipher amalgamation for version $version

rm -rf sqlcipher
git clone https://github.com/sqlcipher/sqlcipher.git --branch $version --single-branch 
cd sqlcipher
./configure --with-crypto-lib=none
make sqlite3.c

cp sqlite3.c ..
cp sqlite3.h ..
cp sqlite3ext.h ..
cp VERSION sqlcipher.VERSION
cp LICENSE.md ..

cd ..
rm -rf sqlcipher

sqlite_version=`cat sqlite3.c | grep "define SQLITE_VERSION " | cut -d '"' -f 2`
echo "SQLite version: ${sqlite_version}" > sqlcipher.VERSION
echo "SQLCiper version: $version" >> sqlcipher.VERSION
git add sqlite3.c sqlite3.h sqlite3ext.h sqlcipher.VERSION LICENSE.md
git commit -m "Add sqlcipher-amalgamation $version"
git tag -f ${version}
