for: y.tab.c lex.yy.c main.c head.h
	gcc y.tab.c lex.yy.c main.c -o for
	
y.tab.c: for.y
	yacc -d for.y -o y.tab.c
	
lex.yy.c: for.l
	lex for.l
	
clean:
	rm for
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h