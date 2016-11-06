%{
	#include "head.h"
    #include "y.tab.h"
    void yyerror(char *);
%}
ID [a-zA-Z_]+
NUMBER [0-9]+
%%
"for"		return FOR;
"++"		return PLUSPLUS;
"--"		return MINUSMINUS;
{NUMBER}	{yylval = atoi(yytext); return NUMBER;}
{ID}		{yylval = *yytext; return ID;}
[;=<>()_/*-]			return *yytext;
[ \t\n]		;
. ;
%%
int yywrap(void) {
    return 1;
}
