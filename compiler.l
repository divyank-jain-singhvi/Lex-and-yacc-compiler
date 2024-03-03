%{
#include "y.tab.h"
void yyerror(char *);
%}

%%
"print" { return PRINT; }
"("	{ return OPENBR; }
")"	{ return CLOSEBR; }
["] { return STR; }
[a-zA-Z]+ { return TEXT; }
.       { yyerror("Invalid character"); }
%%

int yywrap(void) {
  return 1;
}

