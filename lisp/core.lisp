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
      (t 'en-verde) ;si no se encuentra en ninguno de los anteriores rangos quiere decir que esta en verde.
    )
  )
)