%{
	
 	#include "head.h"
    void yyerror(char *);
    void loop();
    int yylex(void);
    int comp;
    int inc;
    int i;
    int inicio,fin;

%}

%token ID NUMBER FOR PLUSPLUS MINUSMINUS LOW
%start program
%%
program
	:program FOR '(' expr ';' expr ';' expr ')' '{' '}' {loop();} 
	|
	;
	
expr
	:ID
	|NUMBER
	|expr '=' expr {inicio = $3;}
	|expr '<' expr {comp = 1; fin = $3;}
	|expr '>' expr {comp = 2; fin = $3;}
	|ID PLUSPLUS { inc = 1;}
	|ID MINUSMINUS { inc = 0;}
	;
	
	
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c

  printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno); 
  exit(1);
}
void loop(){
	switch(comp){
	case 1:
		if(inc)
			for ( i = inicio; i < fin; i++){printf("%d",i);}
		else
			for ( i = inicio; i < fin; i--){printf("%d",i);}
		break;
	case 2:
		if(inc)
			for ( i = inicio; i > fin; i++){printf("%d",i);}
		else
			for ( i = inicio; i > fin; i--){printf("%d",i);}
		break;
	}
}