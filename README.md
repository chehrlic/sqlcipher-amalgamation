## SQLCipher-Amalgamation

This is a helper repo for QSqlCipher-Qt6 which creates the amalgamation version of SQLCipher out of the original SQLCipher repo.
The bash script 'create_amalgamation.sh' basically does:
 * clone the sqlcipher repo from https://github.com/sqlcipher/sqlcipher.git for the given tag
 * calls 'configure
 * calls 'make sqlite3.c'
 * and then copies and adds the output to this git repo and creates the corresponding tag
No error checking is done. 
