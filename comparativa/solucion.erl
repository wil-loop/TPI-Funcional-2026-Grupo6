%	;; ============================================================
%	;; FUNCION: transicion
%	;; NATURALEZA: pura (dado el color actual y al que se desea cambiar retorna una lista con el color actual y la accion a realzar)
%	;; ESTRATEGIA:  funcion simple implementada con clausulas y condicionales/guardas como el when
%	;; IMPACTO: no destructiva
%	;; ============================================================ 

-module(fase3_requerimiento3).
-export([transicion/2]).
 % se pueden "definir" varias veces una funcion con "clausulas", la que de match primero es la que se ejecuta

transicion(ColorActual, _CambiarA) when ColorActual =:= "en-rojo", _CambiarA =:= "amarillo"->
    [ColorActual, "cambiar-a-amarillo"]; % finaliza con ";" --> es una clausula

transicion(ColorActual, _CambiarA) when ColorActual =:= "en-amarillo", _CambiarA =:= "verde" ->
    [ColorActual, "cambiar-a-verde"];

transicion(ColorActual, _CambiarA) when ColorActual =:= "en-verde", _CambiarA =:= "rojo" ->  
    [ColorActual, "cambiar-a-rojo"];

transicion(ColorActual, _CambiarA) ->     
    [ColorActual, "accion-por-defecto"]. % finalizar con "." --> finaliza la funcion

%	;; ============================================================
%	;; FUNCIÓN: timer
%	;; NATURALEZA: Pura (Dado un timestamp devuelve siempre el mismo átomo)
%	;; ESTRATEGIA: Evaluación condicional (Uso de if para emular el cond lógico).
%	;; IMPACTO: No destructiva (No muta estados externos, Erlang impone inmutabilidad)
%	;; ============================================================

timer(TiempoUnix) ->
    Resto = TiempoUnix rem 225, % con una "," indicamos que la ejecución continúa en la siguiente instrucción.
    % se usa rem ya que Erlang no maneja la funcion mod. Además, aqui vinculamos directamente (pattern matching) el valor a la variable Resto.
    if % funciona de manera casi identica a la estructura cond, evalúa las condiciones en orden y se detiene en la primera verdadera.
        Resto =< 89  -> 'en-rojo'; % ";" indica fin de una clausula.
        Resto =< 92  -> 'en-rojo-intermitente';
        Resto =< 212 -> 'en-verde';
        Resto =< 215 -> 'en-verde-intermitente';
        Resto =< 221 -> 'en-amarillo';
        true         -> 'en-amarillo-intermitente' % true es el equivalente a t en Lisp.
    end. % "." indica fin de la función.
