  ;; REQUERIMIENTO 1
	;; ============================================================
	;; FUNCION: transicion
	;; NATURALEZA: pura (dado el color actual y al que se desea cambiar retorna una lista con el color actual y la accion a realzar)
	;; ESTRATEGIA:  funcion simple implementada con condicionales (cond)
	;; IMPACTO: no destructiva
	;; ============================================================ 

	(defun transicion (color-actual cambiar-a)
		(cond 
			((and(equal color-actual 'en-rojo) (equal cambiar-a 'amarillo)) '(en-rojo "cambiar-a-rojo-intermitente")) 
			((and(equal color-actual 'en-rojo-intermitente) (equal cambiar-a 'amarillo)) '(en-rojo-intermitente "cambiar-a-amarillo"))
			((and(equal color-actual 'en-amarillo) (equal cambiar-a 'verde)) '(en-amarillo "cambiar-a-amarillo-intermitente")) 
			((and(equal color-actual 'en-amarillo-intermitente) (equal cambiar-a 'verde)) '(en-amarillo-intermitente "cambiar-a-verde")) 
			((and(equal color-actual 'en-verde) (equal cambiar-a 'rojo)) '(en-verde "cambiar-a-verde-intermitente")) 
			((and(equal color-actual 'en-verde-intermitente) (equal cambiar-a 'rojo)) '(en-verde-intermitente "cambiar-a-rojo")) 
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
  (let ((resto (mod tiempo-unix 225)))
    (cond
      ((<= resto 89)'en-rojo)
	  ((<= resto 92)'en-rojo-intermitente)
      ((<= resto 98)'en-amarillo)
	  ((<= resto 101)'en-amarillo-intermitente)
	  ((<= resto 221)'en-verde)
      (t 'en-verde-intermitente)
    )
  )
)

;; REQUERIMIENTO 3
  ;; ============================================================
  ;; FUNCION: cambios-estado
  ;; NATURALEZA: Impura (Imprime en la terminal de ejecucion)
  ;; ESTRATEGIA: Uso de la funcion incorporada 'format' para salida de texto
  ;; IMPACTO: No destructiva
  ;; ============================================================ 

(defun cambios-estado(tiempo-unix color-anterior color-nuevo)
   (format t "Tiempo ~A: la luz ha cambiado de ~A a ~A~%" 
        tiempo-unix color-anterior color-nuevo
	)
)

;; REQUERIMIENTO 4
;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura (No produce efectos secundarios y siempre devuelve el mismo resultado)
;; ESTRATEGIA: Función aritmética simple
;; IMPACTO: No destructiva
;; =======================================================
(defun duracion-ciclo(duracion-rojo duracion-amarillo duracion-verde rojo-intermitente amarillo-intermitente verde-intermitente)
	(+ duracion-rojo duracion-amarillo duracion-verde rojo-intermitente amarillo-intermitente verde-intermitente)
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

;; REQUERIMIENTO 5
;; ============================================================
;; FUNCION: ciclos-por-tiempo
;; NATURALEZA: Pura (Dado un argumento, siempre le corresponde el mismo resultado)
;; ESTRATEGIA:  Función aritmetica simple / Combinación de operaciones
;; IMPACTO: no destructiva
;; ============================================================ 
(defun ciclos-por-tiempo (minutos)
  	(nth-value 0(floor (* minutos 60) 225))
)

;; REQUERIMIENTO 6

;; ========================================================
;; FUNCIÓN: distribucion-porcentual
;; NATURALEZA: Pura (Siempre devuelve la misma distribución para las mismas reglas de temporización)
;; ESTRATEGIA: Función aritmética simple
;; IMPACTO: No destructiva
;; ========================================================
(defun distribucion-porcentual(duracion-rojo duracion-amarillo duracion-verde rojo-intermitente amarillo-intermitente verde-intermitente)
	(let ((total (+ duracion-rojo duracion-amarillo duracion-verde rojo-intermitente amarillo-intermitente verde-intermitente)))
	  (list
	    (list 'porcentaje-rojo (* (/ duracion-rojo total) 100.0))
		(list 'porcentaje-rojo-intermitente (* (/ rojo-intermitente total) 100.0))
	    (list 'porcentaje-amarillo (* (/ duracion-amarillo total) 100.0))
		(list 'porcentaje-amarillo-intermitente (* (/ amarillo-intermitente total) 100.0))
	    (list 'porcentaje-verde (* (/ duracion-verde total) 100.0))
		(list 'porcentaje-verde-intermitente (* (/ verde-intermitente total) 100.0))
		)
	)
)