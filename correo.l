%{
int ncorreo = 0;
int invalidos = 0;
%}
eb	[ \n\t]+
letra	[a-zA-Z]
numero	[0-9]
signo	[.]
signo2	[@]

usuario		({letra}|{numero})({letra}|{numero}|{signo})*
arroba		{signo2}
plataforma	{letra}+
punto		{signo}
extension	{letra}+
correo		{usuario}{arroba}{plataforma}{punto}{extension}
%%
{eb}		{/*no hacer nada*/};
{correo}	{ncorreo++;}
%%
int main(void){
	int token = yylex();
	while(token){
		printf("token: %d \t lexema: %s \n", token, yytext);
		token = yylex();
	}
	printf("Correos validos: %d", ncorreo);
	return 0;
}


