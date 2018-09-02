package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

%%
%{
    public static LinkedList<TError> TablaEL = new LinkedList<TError>(); 
%}

//directivas
%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//expresiones regulares
program = class Program ([field_decl]*[method_decl]*)
field_decl = 

alpha = ([a-z][A-Z])*
digit = ([0-9]*[.])?[0-9]+
hex_digit = 

%%

//Tokens
<YYINITIAL>"&&"                 { System.out.println("Reconocio "+yytext()+" T_AND"); return new Symbol(Simbolos.T_AND, yycolumn, yyline, yytext()); }
<YYINITIAL> "="                 { System.out.println("Reconocio "+yytext()+" T_ASSIGN"); return new Symbol(Simbolos.T_ASSIGN, yycolumn, yyline, yytext()); }
<YYINITIAL> "bool"              { System.out.println("Reconocio "+yytext()+" T_BOOLTYPE"); return new Symbol(Simbolos.T_BOOLTYPE, yycolumn, yyline, yytext()); }
<YYINITIAL> "break"             { System.out.println("Reconocio "+yytext()+" T_BREAK"); return new Symbol(Simbolos.T_BREAK, yycolumn, yyline, yytext()); }
<YYINITIAL> "char_lit"          { System.out.println("Reconocio "+yytext()+" T_CHARCONSTANT"); return new Symbol(Simbolos.T_CHARCONSTANT, yycolumn, yyline, yytext()); }
<YYINITIAL> "class"             { System.out.println("Reconocio "+yytext()+" T_CLASS"); return new Symbol(Simbolos.T_CLASS, yycolumn, yyline, yytext()); }
<YYINITIAL> ","                 { System.out.println("Reconocio "+yytext()+" T_COMMA"); return new Symbol(Simbolos.T_COMMA, yycolumn, yyline, yytext()); }
<YYINITIAL> "//"                { System.out.println("Reconocio "+yytext()+" T_COMMENT"); return new Symbol(Simbolos.T_COMMENT, yycolumn, yyline, yytext()); }
<YYINITIAL> "continue"          { System.out.println("Reconocio "+yytext()+" T_CONTINUE"); return new Symbol(Simbolos.T_CONTINUE, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"                 { System.out.println("Reconocio "+yytext()+" T_DIV"); return new Symbol(Simbolos.T_DIV, yycolumn, yyline, yytext()); }
<YYINITIAL> "."                 { System.out.println("Reconocio "+yytext()+" T_DOT"); return new Symbol(Simbolos.T_DOT, yycolumn, yyline, yytext()); }
<YYINITIAL> "else"              { System.out.println("Reconocio "+yytext()+" T_ELSE"); return new Symbol(Simbolos.T_ELSE, yycolumn, yyline, yytext()); }
<YYINITIAL> "=="                { System.out.println("Reconocio "+yytext()+" T_EQ"); return new Symbol(Simbolos.T_EQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "extends"           { System.out.println("Reconocio "+yytext()+" T_EXTENDS"); return new Symbol(Simbolos.T_EXTENDS, yycolumn, yyline, yytext()); }
<YYINITIAL> "extern"            { System.out.println("Reconocio "+yytext()+" T_EXTERN"); return new Symbol(Simbolos.T_EXTERN, yycolumn, yyline, yytext()); }
<YYINITIAL> "false"             { System.out.println("Reconocio "+yytext()+" T_FALSE"); return new Symbol(Simbolos.T_FALSE, yycolumn, yyline, yytext()); }
<YYINITIAL> "for"               { System.out.println("Reconocio "+yytext()+" T_FOR"); return new Symbol(Simbolos.T_FOR, yycolumn, yyline, yytext()); }
<YYINITIAL> ">="                { System.out.println("Reconocio "+yytext()+" T_GEQ"); return new Symbol(Simbolos.T_GEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> ">"                 { System.out.println("Reconocio "+yytext()+" T_GT"); return new Symbol(Simbolos.T_GT, yycolumn, yyline, yytext()); }
<YYINITIAL> "ident"             { System.out.println("Reconocio "+yytext()+" T_ID"); return new Symbol(Simbolos.T_ID, yycolumn, yyline, yytext()); }
<YYINITIAL> "if"                { System.out.println("Reconocio "+yytext()+" T_IF"); return new Symbol(Simbolos.T_IF, yycolumn, yyline, yytext()); }
<YYINITIAL> "int_lit"           { System.out.println("Reconocio "+yytext()+" T_INTCONSTANT"); return new Symbol(Simbolos.T_INTCONSTANT, yycolumn, yyline, yytext()); }
<YYINITIAL> "int"               { System.out.println("Reconocio "+yytext()+" T_INTTYPE"); return new Symbol(Simbolos.T_INTTYPE, yycolumn, yyline, yytext()); }
<YYINITIAL> "{"                 { System.out.println("Reconocio "+yytext()+" T_LCB"); return new Symbol(Simbolos.T_LCB, yycolumn, yyline, yytext()); }
<YYINITIAL> "<<"                { System.out.println("Reconocio "+yytext()+" T_LEFTSHIFT"); return new Symbol(Simbolos.T_LEFTSHIFT, yycolumn, yyline, yytext()); }
<YYINITIAL> "<="                { System.out.println("Reconocio "+yytext()+" T_LEQ"); return new Symbol(Simbolos.T_LEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "("                 { System.out.println("Reconocio "+yytext()+" T_LPAREN"); return new Symbol(Simbolos.T_LPAREN, yycolumn, yyline, yytext()); }
<YYINITIAL> "["                 { System.out.println("Reconocio "+yytext()+" T_LSB"); return new Symbol(Simbolos.T_LSB, yycolumn, yyline, yytext()); }
<YYINITIAL> "<"                 { System.out.println("Reconocio "+yytext()+" T_LT"); return new Symbol(Simbolos.T_LT, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"                 { System.out.println("Reconocio "+yytext()+" T_MINUS"); return new Symbol(Simbolos.T_MINUS, yycolumn, yyline, yytext()); }
<YYINITIAL> "%"                 { System.out.println("Reconocio "+yytext()+" T_MOD"); return new Symbol(Simbolos.T_MOD, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"                 { System.out.println("Reconocio "+yytext()+" T_MULT"); return new Symbol(Simbolos.T_MULT, yycolumn, yyline, yytext()); }
<YYINITIAL> "!="                { System.out.println("Reconocio "+yytext()+" T_NEQ"); return new Symbol(Simbolos.T_NEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "new"               { System.out.println("Reconocio "+yytext()+" T_NEW"); return new Symbol(Simbolos.T_NEW, yycolumn, yyline, yytext()); }
<YYINITIAL> "!"                 { System.out.println("Reconocio "+yytext()+" T_NOT"); return new Symbol(Simbolos.T_NOT, yycolumn, yyline, yytext()); }
<YYINITIAL> "null"              { System.out.println("Reconocio "+yytext()+" T_NULL"); return new Symbol(Simbolos.T_NULL, yycolumn, yyline, yytext()); }
<YYINITIAL> "||"                { System.out.println("Reconocio "+yytext()+" T_OR"); return new Symbol(Simbolos.T_OR, yycolumn, yyline, yytext()); }
<YYINITIAL> "+"                 { System.out.println("Reconocio "+yytext()+" T_PLUS"); return new Symbol(Simbolos.T_PLUS, yycolumn, yyline, yytext()); }
<YYINITIAL> "}"                 { System.out.println("Reconocio "+yytext()+" T_RCB"); return new Symbol(Simbolos.T_RCB, yycolumn, yyline, yytext()); }
<YYINITIAL> "return"            { System.out.println("Reconocio "+yytext()+" T_RETURN"); return new Symbol(Simbolos.T_RETURN, yycolumn, yyline, yytext()); }
<YINITIAL> ">>"                 { System.out.println("Reconocio "+yytext()+" T_RIGHTSHIFT"); return new Symbol(Simbolos.T_RIGHTSHIFT, yycolumn, yyline, yytext()); }
<YINITIAL> ")"                  { System.out.println("Reconocio "+yytext()+" T_RPAREN"); return new Symbol(Simbolos.T_RPAREN, yycolumn, yyline, yytext()); }
<YINITIAL> "]"                  { System.out.println("Reconocio "+yytext()+" T_RSB"); return new Symbol(Simbolos.T_RSB, yycolumn, yyline, yytext()); }
<YINITIAL> ";"                  { System.out.println("Reconocio "+yytext()+" T_SEMICOLON"); return new Symbol(Simbolos.T_SEMICOLON, yycolumn, yyline, yytext()); }
<YINITIAL> "string_lit"         { System.out.println("Reconocio "+yytext()+" T_STRINGCONSTANT"); return new Symbol(Simbolos.T_STRINGCONSTANT, yycolumn, yyline, yytext()); }
<YINITIAL> "string"             { System.out.println("Reconocio "+yytext()+" T_STRINGTYPE"); return new Symbol(Simbolos.T_STRINGTYPE, yycolumn, yyline, yytext()); }
<YYINITIAL> "true"              { System.out.println("Reconocio "+yytext()+" T_TRUE"); return new Symbol(Simbolos.T_TRUE, yycolumn, yyline, yytext()); }
<YYINITIAL> "void"              { System.out.println("Reconocio "+yytext()+" T_VOID"); return new Symbol(Simbolos.T_VOID, yycolumn, yyline, yytext()); }
<YYINITIAL> "while"             { System.out.println("Reconocio "+yytext()+" T_WHILE"); return new Symbol(Simbolos.T_WHILE, yycolumn, yyline, yytext()); }
<YYINITIAL> "whitespace"        { System.out.println("Reconocio "+yytext()+" T_WHITESPACE"); return new Symbol(Simbolos.T_WHITESPACE, yycolumn, yyline, yytext()); }
<YYINITIAL> "this"              { System.out.println("Reconocio "+yytext()+" T_THIS"); return new Symbol(Simbolos.T_THIS, yycolumn, yyline, yytext()); }
<YYINITIAL> "double"            { System.out.println("Reconocio "+yytext()+" T_DOUBLE"); return new Symbol(Simbolos.T_DOUBLE, yycolumn, yyline, yytext()); }
<YYINITIAL> "print"             { System.out.println("Reconocio "+yytext()+" T_PRINT"); return new Symbol(Simbolos.T_PRINT, yycolumn, yyline, yytext()); }
<YYINITIAL> "ReadLine"          { System.out.println("Reconocio "+yytext()+" T_READLINE"); return new Symbol(Simbolos.T_READLINE, yycolumn, yyline, yytext()); }
<YYINITIAL> "ReadInteger"       { System.out.println("Reconocio "+yytext()+" T_READINTEGER"); return new Symbol(Simbolos.T_READINTEGER, yycolumn, yyline, yytext()); }
<YYINITIAL> "interface"         { System.out.println("Reconocio "+yytext()+" T_INTERFACE"); return new Symbol(Simbolos.T_INTERFACE, yycolumn, yyline, yytext()); }
<YYINITIAL> "implements"        { System.out.println("Reconocio "+yytext()+" T_IMPLEMENTS"); return new Symbol(Simbolos.T_IMPLEMENTS, yycolumn, yyline, yytext()); }
<YYINITIAL> "NewArray"          { System.out.println("Reconocio "+yytext()+" T_NEWARRAY"); return new Symbol(Simbolos.T_NEWARRAY, yycolumn, yyline, yytext()); }



//Simbolos ER
<YYINITIAL> {numero}    { System.out.println("Reconocio "+yytext()+" num"); return new Symbol(Simbolos.num, yycolumn, yyline, yytext()); }

//Espacios
[ \t\r\n\f]             {/* Espacios en blanco*/}

//Errores Lexicos
.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}

