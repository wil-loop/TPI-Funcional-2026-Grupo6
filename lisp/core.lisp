;; REQUERIMIENTO 3
  ;; ============================================================
  ;; FUNCION: cambios-estado
  ;; NATURALEZA: Impura (Imprime en la terminal de ejecucion)
  ;; ESTRATEGIA: Uso de la funcion incorporada 'format' para salida de texto
  ;; IMPACTO: No destructiva
  ;; ============================================================ 

(defun cambios-estado(tiempo-unix color-anterior color-nuevo)
   (format t "Tiempo ~A: la luz ha cambiado de ~A a ~A~%" 
        tiempo-unix color-anterior color-nuevo))
