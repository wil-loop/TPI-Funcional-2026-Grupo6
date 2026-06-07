;; REQUERIMIENTO 6

;; ========================================================
;; FUNCIÓN: distribucion-porcentual
;; NATURALEZA: Pura (Siempre devuelve la misma distribución para las mismas reglas de temporización)
;; ESTRATEGIA: Función aritmética simple
;; IMPACTO: No destructiva
;; ========================================================
(defun distribucion-porcentual(rojo amarillo verde)
  (list
    (list 'porcentaje-rojo (* (/ rojo  216.0) 100))
    (list 'porcentaje-amarillo (* (/ amarillo  216.0) 100))
    (list 'porcentaje-verde (* (/ verde 216.0) 100)))
  )