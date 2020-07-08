package codigo;
/* Definicion de la creacion de metodos en java */

import static codigo.Tokens.*;

/**
 *La clasa .java que se creara se nombrará "Lexer"
 */

%%

%class Lexer
%type Tokens

Letra=[a-zA-Z_]+
Digito=[0-9]+

espacio=[ ,\t,\r]+

%{
    public String lexeme;
%}
%%
int {lexeme=yytext(); return Int;}
char {lexeme=yytext(); return Char;}
float {lexeme=yytext(); return Float;}
double {lexeme=yytext(); return Double;}
String {lexeme=yytext(); return Cadena;}

public {lexeme=yytext(); return Publico;}
private {lexeme=yytext(); return Private;}

void {lexeme=yytext(); return Sin_Regreso;}

/*Para ignorar espacios y comentarios en el codigo*/
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

"\n" {lexeme=yytext(); return Salto_Linea;}
"(" {lexeme=yytext(); return Parentesis_AP;}
")" {lexeme=yytext(); return Parentesis_CR;}
"{" {lexeme=yytext(); return Llave_AP;}
"}" {lexeme=yytext(); return Llave_CR;}
"," {lexeme=yytext(); return Coma;}


{Letra}({Letra}|{Digito})* {lexeme=yytext(); return Identificador;}
("(-"{Digito}+")")|{Digito}+ {lexeme=yytext(); return Numero;}

 . {return ERROR;}