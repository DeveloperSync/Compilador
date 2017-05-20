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
    { System.out.println("Fin del analisis lexico"); }
%eofval}
/* trabajará conjuntamente con
CUP 
, y le servirálos tokens por demanda. Esto significa que este fichero no puede ejecutarse sólo. */
%cup

%public

/* Macro para identificar los tokens de la expresion regular para numeros enteros */
NUMERO = [1-9][0-9]*
STRING = [A-z][A-z]*
/* ***************FIN DIRECTIVAS JFLEX********************** */

%%

/* *******************EXPRESIONES REGULARES, SOLO NO TERMINALES***************** */

/* Debe devolverse un Symbol al analizador sintáctico que contenga el tipo de token (NUMERO) y su valor (new Integer(yytext())).La funcion */
/* yytext() está implícita en Jlex y devuelve el texto leído de la entrada y quecorresponde con el patron */

{NUMERO} { 
return new Symbol(sym.NUMERO, new Integer(yytext())); }

{STRING} { 
return new Symbol(sym.STRING, new String(yytext())); }

/*TERMINALES PARA OPERACIONES ARITMETICAS*/
"+" { return new Symbol(sym.MAS); }
"-" { return new Symbol(sym.MENOS); }
"*" { return new Symbol(sym.POR); }
"/" { return new Symbol(sym.DIV); }

/*TERMINALES PARA SEPARADORES
"(" { return new Symbol(sym.ABREPAR); }
")" { return new Symbol(sym.CIERRAPAR); }
"{" { return new Symbol(sym.ABRELLAVE); }
"}" { return new Symbol(sym.CIERRALLAVE); }

/*TERMINAL PARA FIN DE LINEA
">" { return new Symbol(sym.FINLINEA); }

/*TERMINAL PARA CONTINUAR PROGRAMANDO EN SIGUIENTE LINEA*/
"@" { return new Symbol(sym.CODINGEXTENDIDO); }

/*TERMINALES OPERACIONES LOGICAS*/
"&" { return new Symbol(sym.AND); }
"|" { return new Symbol(sym.OR); }

/*TERMINALES PALABRAS RESERVADAS*/
"clase" { return new Symbol(sym.CLASE); }
"entero" { return new Symbol(sym.ENTERO); }
"logic"{ return new Symbol(sym.LOGIC); }
"flotante" { return new Symbol(sym.FLOTANTE); }
"aislado"{ return new Symbol(sym.AISLADO); }


/*.|\n { }*/

/* *******************FIN EXPRESIONES REGULARES***************** */
