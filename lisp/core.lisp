;; REQUERIMIENTO 4

;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura (No produce efectos secundarios y siempre devuelve el mismo resultado)
;; ESTRATEGIA: Función aritmética simple
;; IMPACTO: No destructiva
;; =======================================================
(defun duracion-ciclo()
	(+ 90 6 120)
	)

;; ========================================================
;; FUNCIÓN: recomendacion-ciclo
;; NATURALEZA: Pura (Para una misma duración de ciclo siempre devuelve la misma recomendación y no produce efectos secundarios)
;; ESTRATEGIA: Función predicado / Condicional (Implementada mediante cond)
;; IMPACTO: No destructiva
;; ========================================================
(defun recomendacion-ciclo()
	(let ((duracion (duracion-ciclo)))
		(cond 
			((< duracion 35)
				"Ciclo demasiado corto")
			((> duracion 150)
				"Ciclo demasiado largo")
			(t
				"Ciclo en rango óptimo")
		)
	)
)