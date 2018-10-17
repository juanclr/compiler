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

Letter = "'"[A-Za-z]"'"
Word = "'"[A-Za-z]+[0-9]* "'"
Entero = 0 | [1-9][0-9]*
Decimal = [0-9]+ \. [0-9]+
Ident = [A-Za-z_$][A-Za-z_$0-9]*
Hex = 0[xX][0-9a-fA-F]+





//------> Estados

%%
/*------------  3ra Area: Reglas Lexicas ---------*/

//-----> Simbolos

/* operators */
<YYINITIAL> "+"         { System.out.println(yytext()+" mas"); return new Symbol(Simbolos.PLUS, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"         { System.out.println(yytext()+" menos"); return new Symbol(Simbolos.MINUS, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"         { System.out.println(yytext()+" por"); return new Symbol(Simbolos.TIMES, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"         { System.out.println(yytext()+" div"); return new Symbol(Simbolos.DIV, yycolumn, yyline, yytext()); }
<YYINITIAL> "="         { System.out.println(yytext()+" equal"); return new Symbol(Simbolos.EQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "+="         { System.out.println(yytext()+" plus equal"); return new Symbol(Simbolos.PEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "-="         { System.out.println(yytext()+" less equal"); return new Symbol(Simbolos.LEQ, yycolumn, yyline, yytext()); }

<YYINITIAL> ","         { System.out.println(yytext()+" coma"); return new Symbol(Simbolos.COMA, yycolumn, yyline, yytext()); }
<YYINITIAL> "<"         { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.LT, yycolumn, yyline, yytext()); }
<YYINITIAL> ">"         { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.GT, yycolumn, yyline, yytext()); }
<YYINITIAL> "=="        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.EQEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "<="        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.LTEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> ">="        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.GTEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "!="        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.NOTEQ, yycolumn, yyline, yytext()); }
<YYINITIAL> "&&"        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.ANDAND, yycolumn, yyline, yytext()); }
<YYINITIAL> "||"        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.OROR, yycolumn, yyline, yytext()); }
<YYINITIAL> "!"        { System.out.println(yytext()+" opr"); return new Symbol(Simbolos.NEG, yycolumn, yyline, yytext()); }



/* separators */
<YYINITIAL> "("         { System.out.println(yytext()+" Parentesis A"); return new Symbol(Simbolos.PARA, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println(yytext()+" Parentesis C"); return new Symbol(Simbolos.PARC, yycolumn, yyline, yytext()); }
<YYINITIAL> ";"         { System.out.println(yytext()+" puntocoma"); return new Symbol(Simbolos.PUNTOCOMA, yycolumn, yyline, yytext()); }
<YYINITIAL> ":"         { System.out.println(yytext()+" doblePunto"); return new Symbol(Simbolos.DBLPUNTO, yycolumn, yyline, yytext()); }
<YYINITIAL> "["         { System.out.println(yytext()+" brack A"); return new Symbol(Simbolos.OBRACK, yycolumn, yyline, yytext()); }
<YYINITIAL> "]"         { System.out.println(yytext()+" brack C"); return new Symbol(Simbolos.CBRACK, yycolumn, yyline, yytext()); }
<YYINITIAL> "{"         { System.out.println(yytext()+" brace A"); return new Symbol(Simbolos.OBRACE, yycolumn, yyline, yytext()); }
<YYINITIAL> "}"         { System.out.println(yytext()+" brace C"); return new Symbol(Simbolos.CBRACE, yycolumn, yyline, yytext()); }


//-------> Simbolos ER
/* keywords */
<YYINITIAL> "boolean"   { System.out.println(yytext()+" type "); return new Symbol(Simbolos.BOOLEAN,yycolumn, yyline, yytext()); }
<YYINITIAL> "else"      { System.out.println(yytext()+" IfStmt "); return new Symbol(Simbolos.ELSE,yycolumn, yyline, yytext()); }
<YYINITIAL> "if"        { System.out.println(yytext()+" token"); return new Symbol(Simbolos.IF, yycolumn, yyline, yytext()); }
<YYINITIAL> "for"       { System.out.println(yytext()+" token"); return new Symbol(Simbolos.FOR,yycolumn, yyline, yytext()); }
<YYINITIAL> "break"     { System.out.println(yytext()+" token "); return new Symbol(Simbolos.BREAK,yycolumn, yyline, yytext()); }
<YYINITIAL> "class"     { System.out.println(yytext()+" token"); return new Symbol(Simbolos.CLASS, yycolumn, yyline, yytext()); }
<YYINITIAL> "print"     { System.out.println(yytext()+" token"); return new Symbol(Simbolos.PRINT,yycolumn, yyline, yytext()); }
<YYINITIAL> "int"       { System.out.println(yytext()+" type"); return new Symbol(Simbolos.INTG, yycolumn, yyline, yytext()); }
//<YYINITIAL> "String"    { System.out.println(yytext()+" Strg"); return new Symbol(Simbolos.STRG, yycolumn, yyline, yytext()); }
//<YYINITIAL> "double"    { System.out.println(yytext()+"  Dobl"); return new Symbol(Simbolos.DOBL, yycolumn, yyline, yytext()); }
//<YYINITIAL> "char"      { System.out.println(yytext()+"  character"); return new Symbol(Simbolos.CHR, yycolumn, yyline, yytext()); }
<YYINITIAL> "func"      { System.out.println(yytext()+"  function"); return new Symbol(Simbolos.FUNC, yycolumn, yyline, yytext()); }
<YYINITIAL> "Program"   { System.out.println(yytext()+"  token"); return new Symbol(Simbolos.PRGRM, yycolumn, yyline, yytext()); }
<YYINITIAL> "True"      { System.out.println(yytext()+"  verd"); return new Symbol(Simbolos.TRT, yycolumn, yyline, yytext()); }
<YYINITIAL> "False"     { System.out.println(yytext()+"  fals"); return new Symbol(Simbolos.FLS, yycolumn, yyline, yytext()); }
<YYINITIAL> "main"      { System.out.println(yytext()+"  method"); return new Symbol(Simbolos.MAIN, yycolumn, yyline, yytext()); }
<YYINITIAL> "void"      { System.out.println(yytext()+"  type"); return new Symbol(Simbolos.VOID, yycolumn, yyline, yytext()); }
<YYINITIAL> "return"    { System.out.println(yytext()+"  token"); return new Symbol(Simbolos.RTN, yycolumn, yyline, yytext()); }
<YYINITIAL> "continue"  { System.out.println(yytext()+"  token"); return new Symbol(Simbolos.CNT, yycolumn, yyline, yytext()); }
<YYINITIAL> "callout"   { System.out.println(yytext()+"  token"); return new Symbol(Simbolos.CLL, yycolumn, yyline, yytext()); }





//<YYINITIAL> {Decimal}   { System.out.println(yytext()+" decimal"); return new Symbol(Simbolos.DOUBL,yycolumn, yyline, yytext()); }
<YYINITIAL> {Entero}    { System.out.println(yytext()+" num"); return new Symbol(Simbolos.NUM, yycolumn, yyline, yytext()); }
<YYINITIAL> {Letter}    { System.out.println(yytext()+" letra"); return new Symbol(Simbolos.LETTER, yycolumn, yyline, yytext());}
<YYINITIAL> {Word}      { System.out.println(yytext()+" palabra"); return new Symbol(Simbolos.STRGN, yycolumn, yyline, yytext());}
<YYINITIAL> {Ident}     { System.out.println(yytext()+" identifier");return new Symbol(Simbolos.IDNT, yycolumn, yyline, yytext());}
<YYINITIAL> {Hex}       { System.out.println(yytext()+" hexadecimal");return new Symbol(Simbolos.HEX, yycolumn, yyline, yytext());}


/* comments */
//Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

//TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
//EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?




//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos

.                       { System.out.println("Error Lexico "+yytext()+" Linea "+yyline+" Columna "+yycolumn);}
