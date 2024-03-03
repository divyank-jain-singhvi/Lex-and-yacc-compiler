lex compiler.l
yacc -d compiler.y
gcc -o compiler y.tab.c lex.yy.c -ll
./compiler
