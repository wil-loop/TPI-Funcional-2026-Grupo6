	;; REQUERIMIENTO 1
	;; ============================================================
	;; FUNCION: transicion
	;; NATURALEZA: pura (dado el color actual y al que se desea cambiar retorna una lista con el color actual y la accion a realzar)
	;; ESTRATEGIA:  funcion simple implementada con condicionales (cond)
	;; IMPACTO: no destructiva
	;; ============================================================ 

	(defun transicion (color-actual cambiar-a)
		(cond 
			((and(equal color-actual 'en-rojo) (equal cambiar-a 'amarillo)) '('en-rojo "cambiar-a-amarillo")) 
			((and(equal color-actual 'en-amarillo) (equal cambiar-a 'verde) ) '('en-amarillo "cambiar-a-verde")) 
			((and(equal color-actual 'en-verde) (equal cambiar-a 'rojo) ) '('en-verde "cambiar-a-rojo")) 
			(t (list color-actual 'accion-por-defecto))
			)
		)

;; REQUERIMIENTO 2
;; ========================================================
;; FUNCIÓN: timer
;; NATURALEZA: Pura (Dado un timestamp devuelve siempre el mismo color)
;; ESTRATEGIA: Evaluacion condicional (Uso de cond. No requiere orden superior ni recursividad de cola)
;; IMPACTO: No destructiva (No muta estados externos)
;; ========================================================
(defun timer (tiempo-unix)
  (let ((resto (mod tiempo-unix 216)))
    (cond
      ((<= resto 89)'en-rojo)
      ((<= resto 95)'en-amarillo)
      (t ' n-verde) ;si no se encuentra en ninguno de los anteriores rangos quiere decir que esta en verde.
    )
  )
)
