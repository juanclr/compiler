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
<YYINITIAL> "="         { return new Symbol(Simbolos.EQ); }
<YYINITIAL> ">"         { return new Symbol(Simbolos.GT); }
<YYINITIAL> "<"         { return new Symbol(Simbolos.LT); }
<YYINITIAL> "!"         { return new Symbol(Simbolos.NOT); }
<YYINITIAL> "=="        { return new Symbol(Simbolos.EQEQ); }
<YYINITIAL> "<="        { return new Symbol(Simbolos.LTEQ); }
<YYINITIAL> ">="        { return new Symbol(Simbolos.GTEQ); }
<YYINITIAL> "!="        { return new Symbol(Simbolos.NOTEQ); }
<YYINITIAL> "&&"        { return new Symbol(Simbolos.ANDAND); }
<YYINITIAL> "||"        { return new Symbol(Simbolos.OROR); }



/* separators */
<YYINITIAL> "("         { System.out.println("Reconocio "+yytext()+" para"); return new Symbol(Simbolos.para, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println("Reconocio "+yytext()+" parc"); return new Symbol(Simbolos.parc, yycolumn, yyline, yytext()); }
<YYINITIAL> ";"         { System.out.println("Reconocio "+yytext()+" puntocoma"); return new Symbol(Simbolos.puntocoma, yycolumn, yyline, yytext()); }
<YYINITIAL> "["         { return new Symbol(Simbolos.LBRACK); }
<YYINITIAL> "]"         { return new Symbol(Simbolos.RBRACK); }
<YYINITIAL> "{"         { return new Symbol(Simbolos.LBRACE); }
<YYINITIAL> "}"         { return new Symbol(Simbolos.RBRACE); }


//-------> Simbolos ER
/* keywords */
//<YYINITIAL> "boolean"   { return new Symbol(Simbolos.BOOLEAN); }
//<YYINITIAL> "double"    { return new Symbol(Simbolos.DOUBLE); }
//<YYINITIAL> "char"      { return new Symbol(Simbolos.CHAR); }
<YYINITIAL> "else"      { return new Symbol(Simbolos.ELSE); }
<YYINITIAL> "if"        { return new Symbol(Simbolos.IF); }
<YYINITIAL> "switch"    { return new Symbol(Simbolos.SWITCH); }
<YYINITIAL> "for"       { return new Symbol(Simbolos.FOR); }
<YYINITIAL> "break"     { return new Symbol(Simbolos.BREAK); }
<YYINITIAL> "class"     { return new Symbol(Simbolos.CLASS); }
<YYINITIAL> "case"      { return new Symbol(Simbolos.CASE); }
<YYINITIAL> "print"     { return new Symbol(Simbolos.PRINT); }


 /* boolean literals */
 //"true"                { return new Symbol(Simbolos.BOOLEAN_LITERAL, true); }
 //"false"               { return new Symbol(Simbolos.BOOLEAN_LITERAL, false); }



//<YYINITIAL> {Double}    { System.out.println("Reconocio "+yytext()+" decimal"); return new Symbol(Simbolos.double); }
<YYINITIAL> {Int}       { System.out.println("Reconocio "+yytext()+" num"); return new Symbol(Simbolos.num, yycolumn, yyline, yytext()); }
<YYINITIAL> {Letter}    { System.out.println("Reconocio "+yytext()+" letra"); return new Symbol(Simbolos.letr, yycolumn, yyline, yytext());}
<YYINITIAL> {Word}    { System.out.println("Reconocio "+yytext()+" palabra"); return new Symbol(Simbolos.strng, yycolumn, yyline, yytext());}
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

 