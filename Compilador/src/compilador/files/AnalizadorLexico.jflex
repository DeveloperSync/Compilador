/* calculadora.jlex */
/* http://www.academia.edu/4927379/JLex_y_Java_Cup_Instalacion_y_Ejemplo_2 */

/* ********************SECCION CODIGO DE USUARIOS******************** */
/* Se define la libreria que se va a usar en el tiempo de compilacion */
import java_cup.runtime.Symbol;
/* ********************FIN SECCION CODIGO DE USUARIOS**************** */

%%

/* *****************DIRECTIVAS JFLEX*************************** */
/* Codigo a ejecutar una vez alcanzado el final del archivo */
%eofval{
    { System.exit(0); }
%eofval}
/* trabajará conjuntamente con
CUP 
, y le servirálos tokens por demanda. Esto significa que este fichero no puede ejecutarse sólo. */
%cup

/* Macro para identificar los tokens de la expresion regular para numeros enteros */
NUMBER = [1-9][0-9]*
/* ***************FIN DIRECTIVAS JFLEX********************** */

%%

/* *******************EXPRESIONES REGULARES, SOLO NO TERMINALES***************** */

/* Debe devolverse un Symbol al analizador sintáctico que contenga el tipo de token (NUMERO) y su valor (new Integer(yytext())).La funcion */
/* yytext() está implícita en Jlex y devuelve el texto leído de la entrada y quecorresponde con el patron */

{NUMBER} { 
return new Symbol(sym.NUMERO, newInteger(yytext())); }

"+" { return new Symbol(sym.MAS); }
"-" { return new Symbol(sym.MENOS); }
"*" { return new Symbol(sym.POR); }
"/" { return new Symbol(sym.DIV); }
"(" { return new Symbol(sym.PARI); }
")" { return new Symbol(sym.PARD); }
";" { return new Symbol(sym.FIN); }
.|\n { }

/* *******************FIN EXPRESIONES REGULARES***************** */