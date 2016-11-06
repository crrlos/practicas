%{
    #include "head.h"
    void yyerror(char *);
    int yylex(void);
    int sym[26];
%}

%start program
%token INTEGER ID IF ELSE WHILE NUMBER
%left '+' '-'
%left '*' '/'

%%
program
	: program statement
	|
	;
statement
	:selection_statement
	|loop_statement
	|expr ';'
	|ID '=' expr ';'
	;
selection_statement
	: IF '(' condition ')' block
	| IF '(' condition ')' block ELSE block
	;
loop_statement
	: WHILE '('condition ')' block
	;
block
	:statement
	|'{' statements '}'
	;
statements
	:statement statements
	|
	;
expr
	:ID
	|NUMBER
	|expr '+' expr
	|expr '-' expr
	|expr '*' expr
	|expr '/' expr
	|'('expr')'
	;
	
condition
	:condition condition
	|condition_comparing
	|condition_logic
	|expr
	;

condition_logic
	:'&''&'
	|'|''|'
	;
condition_comparing
	
	: "==" 
	| "<="
	| ">=" 
	| "!=" 
	| '<' 
	| '>' 
	;
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c

  printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno); 
  exit(1);
}
