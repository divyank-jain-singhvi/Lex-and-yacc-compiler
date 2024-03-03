%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
char* user_input;

%}

%union {
    char *sval;
}

%token PRINT EOL OPENBR CLOSEBR READ
%token <sval> STRING

%%

program: 
    | program print EOL
    | program input EOL 
    ;

print:
    | PRINT OPENBR STRING CLOSEBR { printf("%s\n", $3); }
    ;
    
input: 
    | READ OPENBR STRING CLOSEBR { user_input = strdup($3); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntex error %s\n", s);
    exit(1);
}

int main(void) {
    yyparse();
    printf("%s\n", user_input);
    return 0;
}
