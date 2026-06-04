










;; ========================================================
;; FUNCIÓN: timer
;; NATURALEZA: a desarrollar
;; ESTRATEGIA: a desarrollar
;; IMPACTO: a desarrollar
;; ========================================================
(defun timer (tiempo-unix)
    (cond
      ((<= (mod tiempo-unix 216) 89)'en-rojo)
      ((<= (mod tiempo-unix 216) 95)'en-amarillo)
      (t 'en-verde) ;si no se encuentra en ninguno de los anteriores rangos quiere decir que esta en verde.
      )
    )