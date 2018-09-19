/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes,importaciones
package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{
    //----> Codigo de usuario en sintaxis java
    //public static LinkedList<TError> TablaEL = new LinkedList<TError>();

%}

//-------> Directivas de JFlex
%public
%class AnalizadorLexico
%cupsym Simbolos
%cup
%char
%column
%full
%line
%unicode

//------> Expresiones Regulares

Letter = [A-Za-z]
Word = {Letter}+
Entero = [0-9][0-9]*
Decimal = [0-9]+ \. [0-9]+
Ident = [A-Za-z_$][A-Za-z_$0-9]*
ClsIdnt = [A-Za-z]+


//------> Estados

%%
/*------------  3ra Area: Reglas Lexicas ---------*/

//-----> Simbolos

/* operators */
<YYINITIAL> "+"         { System.out.println("Reconocio "+yytext()+" mas"); return new Symbol(Simbolos.PLUS, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"         { System.out.println("Reconocio "+yytext()+" menos"); return new Symbol(Simbolos.MINUS, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"         { System.out.println("Reconocio "+yytext()+" por"); return new Symbol(Simbolos.TIMES, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"         { System.out.println("Reconocio "+yytext()+" div"); return new Symbol(Simbolos.DIV, yycolumn, yyline, yytext()); }
<YYINITIAL> "="         { System.out.println("Reconocio "+yytext()+" equal"); return new Symbol(Simbolos.EQ, yycolumn, yyline, yytext()); }
//<YYINITIAL> "<"         { return new Symbol(Simbolos.LT); }
//<YYINITIAL> "!"         { return new Symbol(Simbolos.NOT); }
//<YYINITIAL> "=="        { return new Symbol(Simbolos.EQEQ); }
//<YYINITIAL> "<="        { return new Symbol(Simbolos.LTEQ); }
//<YYINITIAL> ">="        { return new Symbol(Simbolos.GTEQ); }
//<YYINITIAL> "!="        { return new Symbol(Simbolos.NOTEQ); }
//<YYINITIAL> "&&"        { return new Symbol(Simbolos.ANDAND); }
//<YYINITIAL> "||"        { return new Symbol(Simbolos.OROR); }



/* separators */
<YYINITIAL> "("         { System.out.println("Reconocio "+yytext()+" Parentesis A"); return new Symbol(Simbolos.PARA, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println("Reconocio "+yytext()+" Parentesis C"); return new Symbol(Simbolos.PARC, yycolumn, yyline, yytext()); }
<YYINITIAL> ";"         { System.out.println("Reconocio "+yytext()+" puntocoma"); return new Symbol(Simbolos.PUNTOCOMA, yycolumn, yyline, yytext()); }
<YYINITIAL> ":"         { System.out.println("Reconocio "+yytext()+" doblePunto"); return new Symbol(Simbolos.DBLPUNTO, yycolumn, yyline, yytext()); }
//<YYINITIAL> "["         { return new Symbol(Simbolos.LBRACK,yycolumn, yyline, yytext()); }
//<YYINITIAL> "]"         { return new Symbol(Simbolos.RBRACK,yycolumn, yyline, yytext()); }
<YYINITIAL> "{"         { System.out.println("Reconocio "+yytext()+" brack A"); return new Symbol(Simbolos.LBRACE, yycolumn, yyline, yytext()); }
<YYINITIAL> "}"         { System.out.println("Reconocio "+yytext()+" brack C"); return new Symbol(Simbolos.RBRACE, yycolumn, yyline, yytext()); }


//-------> Simbolos ER
/* keywords */
//<YYINITIAL> "boolean"   { return new Symbol(Simbolos.BOOLEAN,yycolumn, yyline, yytext()); }
<YYINITIAL> "else"      { System.out.println(yytext()+" IfStmt "); return new Symbol(Simbolos.ELSE,yycolumn, yyline, yytext()); }
<YYINITIAL> "if"        { System.out.println(yytext()+" IfElsetmt "); return new Symbol(Simbolos.IF, yycolumn, yyline, yytext()); }
<YYINITIAL> "switch"    { return new Symbol(Simbolos.SWITCH,yycolumn, yyline, yytext()); }
<YYINITIAL> "while"     { return new Symbol(Simbolos.WHILE, yycolumn, yyline, yytext()); }
<YYINITIAL> "for"       { return new Symbol(Simbolos.FOR,yycolumn, yyline, yytext()); }
<YYINITIAL> "break"     { return new Symbol(Simbolos.BREAK,yycolumn, yyline, yytext()); }
<YYINITIAL> "Class"     { System.out.println(yytext()+" class");return new Symbol(Simbolos.CLASS, yycolumn, yyline, yytext()); }
//<YYINITIAL> "case"      { return new Symbol(Simbolos.CASE); }
<YYINITIAL> "print"     { System.out.println(yytext()+" PrintStmt "); return new Symbol(Simbolos.PRINT,yycolumn, yyline, yytext()); }
<YYINITIAL> "int"       { System.out.println(yytext()+" int"); return new Symbol(Simbolos.INTG, yycolumn, yyline, yytext()); }
<YYINITIAL> "String"    { System.out.println(yytext()+" Strg"); return new Symbol(Simbolos.STRG, yycolumn, yyline, yytext()); }
<YYINITIAL> "double"    { System.out.println(yytext()+"  Dobl"); return new Symbol(Simbolos.DOBL, yycolumn, yyline, yytext()); }


 /* boolean literals */
 //"true"                { return new Symbol(Simbolos.BOOLEAN_LITERAL, true); }
 //"false"               { return new Symbol(Simbolos.BOOLEAN_LITERAL, false); }



<YYINITIAL> {Decimal}   { System.out.println(yytext()+" decimal"); return new Symbol(Simbolos.DOUBL,yycolumn, yyline, yytext()); }
<YYINITIAL> {Entero}    { System.out.println(yytext()+" num"); return new Symbol(Simbolos.NUM, yycolumn, yyline, yytext()); }
<YYINITIAL> {Letter}    { System.out.println(+yytext()+" letra"); return new Symbol(Simbolos.LETTER, yycolumn, yyline, yytext());}
<YYINITIAL> {Word}      { System.out.println(yytext()+" palabra"); return new Symbol(Simbolos.STRGN, yycolumn, yyline, yytext());}
<YYINITIAL> {Ident}     { System.out.println(+yytext()+" identifier");return new Symbol(Simbolos.IDNT, yycolumn, yyline, yytext());}
<YYINITIAL> {ClsIdnt}   { System.out.println(+yytext()+" classIdnt");return new Symbol(Simbolos.CLSIDNT, yycolumn, yyline, yytext());}


/* comments */
//Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

//TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
//EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?




//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos

.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);}
                          //TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          //TablaEL.add(datos);}
