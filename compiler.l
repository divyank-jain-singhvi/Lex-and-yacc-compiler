%{
#include "y.tab.h"
%}


%%

"print" { return PRINT; }
"read"	{return READ; }
"("	{ return OPENBR; }
")"	{ return CLOSEBR; }
"\""	{ return STR;}
\"[^\"\n]*\" {
    yytext[strlen(yytext)-1] = 0;
    yylval.sval = strdup(yytext+1);
    return STRING;
}
[0-9]+    { yylval.ival = atoi(yytext); return INT; }
\n        { return EOL; }
.         { }

%%

