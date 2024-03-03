yacc -d compiler.y
lex compiler.l
cc y.tab.c lex.yy.c -o compiler
./compiler
