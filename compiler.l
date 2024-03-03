%{
#include "y.tab.h"
%}


%%

"print"   { return PRINT; }
"("	{ return OPENBR; }
")"	{ return CLOSEBR; }
\"[^\"\n]*\" {
    yytext[strlen(yytext)-1] = 0;
    yylval.sval = strdup(yytext+1);
    return STRING;
}
\n        { return EOL; }
.         { }

%%

