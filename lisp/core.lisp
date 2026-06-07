;; REQUERIMIENTO 4

;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura (No produce efectos secundarios y siempre devuelve el mismo resultado)
;; ESTRATEGIA: Función aritmética simple
;; IMPACTO: No destructiva
;; =======================================================
(defun duracion-ciclo(rojo amarillo verde)
	(print (+ rojo amarillo verde))
	(recomendacion-ciclo(+ rojo amarillo verde))
)

;; ========================================================
;; FUNCIÓN: recomendacion-ciclo
;; NATURALEZA: Pura (Para una misma duración de ciclo siempre devuelve la misma recomendación y no produce efectos secundarios)
;; ESTRATEGIA: Función Condicional simple (Implementada mediante cond)
;; IMPACTO: No destructiva
;; ========================================================
(defun recomendacion-ciclo(duracion)
	(cond 
		((< duracion 35)
			"Ciclo demasiado corto")
		((> duracion 150)
			"Ciclo demasiado largo")
		(t
			"Ciclo en rango óptimo")
	)	
)
