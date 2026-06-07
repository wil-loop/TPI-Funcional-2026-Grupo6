;; ============================================================
;; FUNCION: ciclos-por-tiempo
;; NATURALEZA: Pura (Dado un argumento, siempre le corresponde el mismo resultado)
;; ESTRATEGIA:  Función aritmetica simple / Combinación de operaciones
;; IMPACTO: no destructiva
;; ============================================================ 
(defun ciclos-por-tiempo (minutos)
  	(nth-value 0(floor (* minutos 60) 216))
  )
