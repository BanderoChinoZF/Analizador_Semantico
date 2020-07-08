package codigo;
/* Definicion de la creacion de metodos en java */

import java_cup.runtime.Symbol;

/**
 *La clasa .java que se creara se nombrará "Lexer"
 */

%%

%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

Letra=[a-zA-Z_]+
Digito=[0-9]+

espacio=[ ,\t,\r,\n]+

%{
    private Symbol symbol(int type, Object value)
    {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type)
    {
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
int {return new Symbol(sym.Int, yychar, yyline, yytext());}
char {return new Symbol(sym.Char, yychar, yyline, yytext());}
float {return new Symbol(sym.Float, yychar, yyline, yytext());}
double {return new Symbol(sym.Double, yychar, yyline, yytext());}
String {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

public {return new Symbol(sym.Publico, yychar, yyline, yytext());}
private {return new Symbol(sym.Private, yychar, yyline, yytext());}

void {return new Symbol(sym.Sin_Regreso, yychar, yyline, yytext());}

/*Para ignorar espacios y comentarios en el codigo*/
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

"(" {return new Symbol(sym.Parentesis_AP, yychar, yyline, yytext());}
")" {return new Symbol(sym.Parentesis_CR, yychar, yyline, yytext());}
"{" {return new Symbol(sym.Llave_AP, yychar, yyline, yytext());}
"}" {return new Symbol(sym.Llave_CR, yychar, yyline, yytext());}
"," {return new Symbol(sym.Coma, yychar, yyline, yytext());}


{Letra}({Letra}|{Digito})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{Digito}+")")|{Digito}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
