import java_cup.runtime.*;

%%
%cup
%public
%class Lexer
%line
%column
%{
    private Symbol symbol(int type) { return new Symbol(type, yyline, yycolumn);}
    private Symbol symbol(int type, Object value) { return new Symbol(type, yyline, yycolumn, value);}
%}

DIGITO = [0-9]
LETRA = [a-zA-Z_]
LITERAL = \"[^\"]*\"
INTEIRO = {DIGITO}+
DECIMAL = {DIGITO}"."{DIGITO}
VARIAVEL = {LETRA}+

IGNORE = [\n|\s|\t|\r|"("|")"| ]
%%

<YYINITIAL>{
    "programa"              {System.out.println("Token reconhecido: PROGRAMA"); return new Symbol(Sym.PROGRAMA);}
    "inicio"                {System.out.println("Token reconhecido: INICIO"); return new Symbol(Sym.INICIO);}
    "fim"                   {System.out.println("Token reconhecido: FIM"); return new Symbol(Sym.FIM);}
    "int"                   {System.out.println("Token reconhecido: TIPO_INTEIRO"); return new Symbol(Sym.TIPO_INTEIRO);}
    "float"                 {System.out.println("Token reconhecido: TIPO_DECIMAL"); return new Symbol(Sym.TIPO_DECIMAL);}
    "="                     {System.out.println("Token reconhecido: IGUAL"); return new Symbol(Sym.IGUAL); }
    "if"                    {System.out.println("Token reconhecido: Operador logico"); return new Symbol(Sym.OPERADORESLOGICOS);}
    "*"                     {System.out.println("Token reconhecido: MULT"); return new Symbol(Sym.MULT);}
    ">"                     {System.out.println("Token reconhecido: MAIOR"); return new Symbol(Sym.MAIOR);}
    ";"                     {System.out.println("Token reconhecido: PTVG"); return new Symbol(Sym.PTVG);}
    {INTEIRO}               {System.out.println("Token reconhecido: INTEIRO"); return new Symbol(Sym.INTEIRO);}
    {DECIMAL}               {System.out.println("Token reconhecido: DECIMAL"); return new Symbol(Sym.DECIMAL);}
    {VARIAVEL}              {System.out.println("Token reconhecido: VARIAVEL"); return new Symbol(Sym.VARIAVEL);}
    {IGNORE}                {}
}

<<EOF>> { return new Symbol ( Sym.EOF ); }
[^]     {throw new Error("caracter invalido: "+yytext()+" na linha "+(yyline+1)+", coluna "+(yycolumn+1) ); }


