# JavaMiniParser
    To Run The Parser: 
    chmod 777 javacompl.sh
    ./javacompl.sh

//This is to run the parser

bison -d a.y
gcc lex.yy.c a.tab.c -o parser
./parser

//This is to run the Symboltable

flex tokgen.l
gcc lex.yy.c -o symtable
./symtable

