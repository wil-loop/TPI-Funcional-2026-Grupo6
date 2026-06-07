	;; ============================================================
	;; FUNCION: transicion
	;; NATURALEZA: pura (dado el color actual y al que se desea cambiar retorna una lista con el color actual y la accion a realzar)
	;; ESTRATEGIA:  funcion simple implementada con condicionales (cond)
	;; IMPACTO: no destructiva
	;; ============================================================ 

	(defun transicion (color-actual cambiar-a)
		(cond 
			((and(equal color-actual 'en-rojo) (equal cambiar-a 'amarillo)) '('en-rojo 'cambiar-a-amarillo) ) 
			((and(equal color-actual 'en-amarillo) (equal cambiar-a 'verde) ) '('en-amarillo 'cambiar-a-verde)) 
			((and(equal color-actual 'en-verde) (equal cambiar-a 'rojo) ) '('en-verde 'cambiar-a-rojo) ) 
			(t (list color-actual 'accion-por-defecto))
			)
		)
