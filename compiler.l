%{
#include "y.tab.h"
%}


%%

"print"   { return PRINT; }
"("	{ return OPENBR; }
")"	{ return CLOSEBR; }
"\""     { return STR; }
[a-zA-Z]+ { yylval.sval = strdup(yytext); return ID; }
\"[^\"\n]*\" {
    yytext[strlen(yytext)-1] = 0;
    yylval.sval = strdup(yytext+1);
    return STRING;
}
[0-9]+    { yylval.ival = atoi(yytext); return INT; }
\n        { return EOL; }
.         { }

%%

