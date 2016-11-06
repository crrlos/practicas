%{
#define PROCESO         1
#define PARA            2
#define HASTA           3
#define CON_PASO        4
#define HACER           5
#define FIN_PARA        6
#define SI              7
#define ENTONCES        8
#define SINO            9
#define FIN_SI          10
#define FINPROCESO      11
#define ID              12
#define INTEGER         13
#define OPERADOR        14      
%}
eb      [ \n\t]+
letra   [a-zA-Z]
numero  [0-9]
signo   (<|>|<=|>=|==|\+\+|--|\+=|-=|\*=|\/=|&&)
id      {letra}({letra}|{numero})*
integer ({numero})+



%%
{eb}            {/*nada*/}
"Para"          return PARA;
"Hasta"         return HASTA;
"Con Paso"      return CON_PASO;
"Hacer"         return HACER;
"Fin Para"      return FIN_PARA;
"Si"            return SI;
"Entonces"      return ENTONCES;
"Sino"          return SINO;
"Fin Si"        return FIN_SI;
{signo}        return OPERADOR;
{id}            return ID;
{integer}       return INTEGER;
%%
int main(void){
        int token = yylex();
        while(token){
                printf("token: %d \t lexema: %s\n", token, yytext);
                token = yylex();
        }
        return 0;
}
