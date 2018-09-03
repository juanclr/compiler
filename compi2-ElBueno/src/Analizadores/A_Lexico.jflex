/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes,importaciones
package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{
    //----> Codigo de usuario en sintaxis java
    public static LinkedList<TError> TablaEL = new LinkedList<TError>(); 

%}

//-------> Directivas de JFlex
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

//------> Expresiones Regulares
//InputChar = [^\n\r]
SpaceChar = [\ \t]
newline = \n|\r|\r\n
Letter = [A-Za-z]
Word = {Letter}+
Int = [1-9][0-9]*
//OctalInt = 0[0-7]+
//HexInt = 0[xX][0-9a-fA-F]+
//Integer = ({DecInt} | {OctalInt} | {HexInt} )[lL]?
Exponent = [eE] [\+\-]? [0-9]+
Double = [0-9]+ \. [0-9]+ {Exponent}?
Ident = [A-Za-z_$] [A-Za-z_$0-9]*


//------> Estados

%%
/*------------  3ra Area: Reglas Lexicas ---------*/

//-----> Simbolos

/* operators */
<YYINITIAL> "+"         { System.out.println("Reconocio "+yytext()+" mas"); return new Symbol(Simbolos.mas, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"         { System.out.println("Reconocio "+yytext()+" menos"); return new Symbol(Simbolos.menos, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"         { System.out.println("Reconocio "+yytext()+" por"); return new Symbol(Simbolos.por, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"         { System.out.println("Reconocio "+yytext()+" div"); return new Symbol(Simbolos.div, yycolumn, yyline, yytext()); }
<YYINITIAL> "="         { return Symbol(Simbolos.EQ); }
<YYINITIAL> ">"         { return Symbol(Simbolos.GT); }
<YYINITIAL> "<"         { return Symbol(Simbolos.LT); }
<YYINITIAL> "!"         { return Symbol(Simbolos.NOT); }
<YYINITIAL> "=="        { return Symbol(Simbolos.EQEQ); }
<YYINITIAL> "<="        { return Symbol(Simbolos.LTEQ); }
<YYINITIAL> ">="        { return Symbol(Simbolos.GTEQ); }
<YYINITIAL> "!="        { return Symbol(Simbolos.NOTEQ); }
<YYINITIAL> "&&"        { return Symbol(Simbolos.ANDAND); }
<YYINITIAL> "||"        { return Symbol(Simbolos.OROR); }



/* separators */
<YYINITIAL> "("         { System.out.println("Reconocio "+yytext()+" para"); return new Symbol(Simbolos.para, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println("Reconocio "+yytext()+" parc"); return new Symbol(Simbolos.parc, yycolumn, yyline, yytext()); }
<YYINITIAL> ";"         { System.out.println("Reconocio "+yytext()+" puntocoma"); return new Symbol(Simbolos.puntocoma, yycolumn, yyline, yytext()); }
<YYINITIAL> "["         { return Symbol(Simbolos.LBRACK); }
<YYINITIAL> "]"         { return Symbol(Simbolos.RBRACK); }
<YYINITIAL> "{"         { return Symbol(Simbolos.LBRACE); }
<YYINITIAL> "}"         { return Symbol(Simbolos.RBRACE); }
  

//-------> Simbolos ER
/* keywords */
<YYINITIAL> "boolean"   { return Symbol(Simbolos.BOOLEAN); }
<YYINITIAL> "double"    { return Symbol(Simbolos.DOUBLE); }
<YYINITIAL> "char"      { return Symbol(Simbolos.CHAR); }
<YYINITIAL> "else"      { return Symbol(Simbolos.ELSE); }
<YYINITIAL> "if"        { return Symbol(Simbolos.IF); }
<YYINITIAL> "switch"    { return Symbol(Simbolos.SWITCH); }
<YYINITIAL> "for"       { return Symbol(Simbolos.FOR); }
<YYINITIAL> "break"     { return Symbol(Simbolos.BREAK); }
<YYINITIAL> "class"     { return Symbol(Simbolos.CLASS); }
<YYINITIAL> "case"      { return Symbol(Simbolos.CASE); }


 /* boolean literals */
 "true"                { return Symbol(Simbolos.BOOLEAN_LITERAL, true); }
 "false"               { return Symbol(Simbolos.BOOLEAN_LITERAL, false); }



<YYINITIAL> {Double}    { System.out.println("Reconocio "+yytext()+" decimal"); return Symbol(Simbolos.double); }
<YYINITIAL> {Int}       { System.out.println("Reconocio "+yytext()+" num"); return new Symbol(Simbolos.num, yycolumn, yyline, yytext()); }
<YYINITIAL> {Letter}    { System.out.println("Reconocio "+yytext()+" letra"); return new Symbol(Simbolos.letr, yycolumn, yyline, yytext());}
<YYINITIAL> {Word}      { System.out.println("Reconocio "+yytext()+" palabra"); return new Symbol(Simbolos.string, yycolumn, yyline, yytext());}
<YYINITIAL> {Exponent}  { System.out.println("Reconocio "+yytext()+" exp");return new Symbol(Simbolos.exp, yycolumn, yyline, yytext());}
<YYINITIAL> {Ident}     { System.out.println("Reconocio "+yytext()+" identifier");return new Symbol(Simbolos.ident, yycolumn, yyline, yytext());}



/* comments */
//Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

//TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
//EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?




//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos

.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}


