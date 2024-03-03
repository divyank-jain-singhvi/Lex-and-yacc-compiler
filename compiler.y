%{
#define YYSTYPE int
#include <stdio.h>
void yyerror(char *);
int yylex(void);
%}

%token OPENBR CLOSEBR PRINT STR TEXT

%%


print: PRINT
   | PRINT OPENBR STR TEXT STR CLOSEBR { printf("hello"); }
   ;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}

