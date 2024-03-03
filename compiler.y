%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

extern int yylineno;
extern char* yytext;

%}

%union {
    int ival;
    char *sval;
}

%token PRINT EOL OPENBR CLOSEBR STR
%token <sval> ID
%token <sval> STRING
%token <ival> INT

%type <sval> string_expression
%type <ival> int_expression

%%

program: 
    | program statement EOL
    ;

statement:
    | PRINT OPENBR STR int_expression STR CLOSEBR { printf("%d\n", $4); }
    | PRINT string_expression { printf("%s\n", $2); }
    | PRINT OPENBR STRING CLOSEBR { printf("%s\n", $3); }
    ;

int_expression: INT { $$ = $1; }
    ;

string_expression: STRING { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}

int main(void) {
    yyparse();
    return 0;
}

