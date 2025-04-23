%{
#include "y.tab.h"
#include <string.h>
%}

%%
"->"                { return ARROW; }
[A-Z]+              { yylval.str = strdup(yytext); return LHS; }
[a-zA-Z]+           { yylval.str = strdup(yytext); return RHS; }
\n                  { return NEWLINE; }
[ \t]               ; // Ignore whitespace
.                   ; // Ignore any other characters
%%

int yywrap() {
    return 1;
}
