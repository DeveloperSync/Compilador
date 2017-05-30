%%


/* *****************DIRECTIVAS JFLEX*************************** */
/* Codigo a ejecutar una vez alcanzado el final del archivo */
%eofval{
    { System.out.println("Analisis lexico terminado");System.exit(0); }
%eofval}
/* trabajará conjuntamente con CUP  , y le servirálos tokens por demanda. Esto significa que este fichero no puede ejecutarse sólo. */

%public
%cup
/* Macro para identificar los tokens de la expresion regular para numeros enteros */
NUMERO = [1-9][0-9]*
STRING = [A-z][A-z]*


/* Caracteres */ 
TerminadorLinea = \r | \n | \r\n 
Caracter = [^\r\n] 
Espacio = [ \t\f]

/* Comentario */
Comentario = {ComentarioMultilinea} | {ComentarioLinea} 
ComentarioMultilinea = "/*" [^*] ~"*/" | "/*" "*"+ "/" 
ComentarioLinea = "//" {STRING}*

/* ***************FIN DIRECTIVAS JFLEX********************** */

%%

/* *******************EXPRESIONES REGULARES, SOLO NO TERMINALES***************** */

/* Debe devolverse un Symbol al analizador sintáctico que contenga el tipo de token (NUMERO) y su valor (new Integer(yytext())).La funcion */
/* yytext() está implícita en Jlex y devuelve el texto leído de la entrada y quecorresponde con el patron */


%%
/* TERMINALES PARA OPERACIONES ARITMETICAS */
"+" { return new Symbol(sym.MAS, yytext()); }
"-" { return new Symbol(sym.MENOS, yytext()); }
"*" { return new Symbol(sym.POR, yytext()); }
"/" { return new Symbol(sym.DIV, yytext()); }
":=" { return new Symbol(sym.IGUAL, yytext()); }
"." { return new Symbol(sym.PUNTO, yytext()); }

/* TERMINALES PARA SEPARADORES */
"(" { return new Symbol(sym.ABREPAR, yytext()); }
")" { return new Symbol(sym.CIERRAPAR, yytext()); }
"{" { return new Symbol(sym.ABRELLAVE, yytext()); }
"}" { return new Symbol(sym.CIERRALLAVE, yytext()); }
"#" { return new Symbol(sym.TEXTDEC, yytext()); }
";" { return new Symbol(sym.FINLINEA, yytext()); }

/* TERMINALES OPERACIONES LOGICAS */
"&" { return new Symbol(sym.AND, yytext()); }
"|" { return new Symbol(sym.OR, yytext()); }

/* TERMINALES PALABRAS RESERVADAS */

"clase" { return new Symbol(sym.CLASE, yytext()); }
"entero" { return new Symbol(sym.ENTERO, yytext()); }
"logico" { return new Symbol(sym.LOGIC, yytext()); }
"flotante" { return new Symbol(sym.FLOTANTE, yytext()); }
"rutina" { return new Symbol(sym.RUTINA, yytext()); }
"texto" { return new Symbol(sym.TEXTO, yytext()); }
"hacer_si" { return new Symbol(sym.IF, yytext()); }
"hacer_sino" { return new Symbol(sym.ELSE, yytext()); }

{NUMERO} { return new Symbol(sym.NUMERO, new Integer(yytext())); }

{STRING} { return new Symbol(sym.STRING, new String(yytext())); }

/* Caracteres */ 
{TerminadorLinea} { } 

/* Comentario */
{Comentario} { } 
{ComentarioMultilinea} { }
.|\n { } 

/* *******************FIN EXPRESIONES REGULARES***************** */
