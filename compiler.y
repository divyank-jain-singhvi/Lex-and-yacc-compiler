%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

%}

%union {
    char *sval;
}

%token PRINT EOL OPENBR CLOSEBR
%token <sval> STRING

%%

program: 
    | program statement EOL
    ;

statement:
    | PRINT OPENBR STRING CLOSEBR { printf("%s\n", $3); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntex error %s\n", s);
    exit(1);
}

int main(void) {
    yyparse();
    return 0;
}
