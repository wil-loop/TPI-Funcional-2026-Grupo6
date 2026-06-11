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

