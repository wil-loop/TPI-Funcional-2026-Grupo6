  ;; REQUERIMIENTO 1
	;; ============================================================
	;; FUNCION: transicion
	;; NATURALEZA: pura (dado el color actual y al que se desea cambiar retorna una lista con el color actual y la accion a realzar)
	;; ESTRATEGIA:  funcion simple implementada con condicionales (cond)
	;; IMPACTO: no destructiva
	;; ============================================================ 

	(defun transicion (color-actual cambiar-a)
		(cond 
			((and(equal color-actual 'en-rojo) (equal cambiar-a 'verde)) '(en-rojo "cambiar-a-rojo-intermitente")) 
			((and(equal color-actual 'en-rojo-intermitente) (equal cambiar-a 'verde)) '(en-rojo-intermitente "cambiar-a-verde"))
			((and(equal color-actual 'en-verde) (equal cambiar-a 'amarillo)) '(en-verde "cambiar-a-verde-intermitente")) 
			((and(equal color-actual 'en-verde-intermitente) (equal cambiar-a 'amarillo)) '(en-verde-intermitente "cambiar-a-amarillo")) 
			((and(equal color-actual 'en-amarillo) (equal cambiar-a 'rojo)) '(en-amarillo "cambiar-a-amarillo-intermitente")) 
			((and(equal color-actual 'en-amarillo-intermitente) (equal cambiar-a 'rojo)) '(en-amarillo-intermitente "cambiar-a-rojo")) 
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
      ((<= resto 212)'en-verde)
	  ((<= resto 215)'en-verde-intermitente)
	  ((<= resto 221)'en-amarillo)
      (t 'en-amarillo-intermitente)
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

;; REQUERIMIENTO 7: EJEMPLOS DE USO


;; -------------------------
;; Ejemplos de transicion 
;; -------------------------

;; Reglas actuales
;; (transicion 'en-rojo 'amarillo) (transicion 'en-amarillo 'verde) (transicion 'en-rojo 'verde)

;; Caso alternativo
;; (transicion 'en-verde 'amarillo) Caso contemplado de transicion invalida, no provoca un fallo en el programa

;; Caso inválido
;; (transicion 'en-verde) Uso inadecuado de la funcion (falta de parametros)



;; -------------------------
;; Ejemplos de timer
;; -------------------------

;; Reglas actuales
;; (timer 20010)

;; Caso alternativo
;; (timer (+ 2215 211 ... n))

;; Caso inválido
;; (timer "string")



;; -------------------------
;; Ejemplos de cambios-estado 
;; -------------------------

;; Reglas actuales
;; (cambios-estado "rojo" "verde")

;; Caso alternativo
;; (cambios-estado "verde" "amarillo")

;; Caso inválido
;; (cambios-estado rojo verde)



;; -------------------------
;; Ejemplos de duracion-ciclo
;; -------------------------

;; Reglas actuales
;; (duracion-ciclo 90 6 120)

;; Caso alternativo
;; (duracion-ciclo 60 6 60)

;; Caso inválido
;; (duracion-ciclo 60 20) Uso inadecuado de la funcion



;; -------------------------
;; Ejemplos de recomendacion-ciclo 
;; -------------------------

;; Reglas actuales
;; (recomendacion-ciclo (duracion-ciclo 90 6 120))

;; Caso alternativo
;; (recomendacion-ciclo 216)

;; Caso inválido
;; (recomendacion-ciclo '(216))



;; -------------------------
;; Ejemplos de ciclos-por-tiempo
;; -------------------------

;; Reglas actuales
;; (ciclos-por-tiempo 15)

;; Caso alternativo
;; (ciclos-por-tiempo 60)

;; Caso inválido
;; (ciclos-por-tiempo '(20)) Uso inadecuado de la funcion



;; -------------------------
;; Ejemplos de distribucion-porcentual
;; -------------------------

;; Reglas actuales
;; (distribucion-porcentual 90 6 120)

;; Caso alternativo
;; (distribucion-porcentual 60 5 70)

;; Caso inválido
;; (distribucion-porcentual 90 -6 120) Uso inadecuado de la funcion






;; ============================================================================
;; ITERACIÓN 2 - EXTENSIÓN 1: Intermitencia de Seguridad
;; ============================================================================
 
  ;; REQUERIMIENTO 1 - Actualizado a Extension 1
  ;; ============================================================
  ;; FUNCION: transicion
  ;; NATURALEZA: pura (dado el color actual y al que se desea cambiar retorna una lista con el color actual y la accion a realzar)
  ;; ESTRATEGIA:  funcion simple implementada con condicionales (cond)
  ;; IMPACTO: no destructiva
  ;; ============================================================ 
#|
  (defun transicion (color-actual cambiar-a)
    (cond 
      ((and(equal color-actual 'en-rojo) (equal cambiar-a 'verde)) '(en-rojo "cambiar-a-rojo-intermitente")) 
      ((and(equal color-actual 'en-rojo-intermitente) (equal cambiar-a 'verde)) '(en-rojo-intermitente "cambiar-a-verde"))
      ((and(equal color-actual 'en-verde) (equal cambiar-a 'amarillo)) '(en-verde "cambiar-a-verde-intermitente")) 
      ((and(equal color-actual 'en-verde-intermitente) (equal cambiar-a 'amarillo)) '(en-verde-intermitente "cambiar-a-amarillo")) 
      ((and(equal color-actual 'en-amarillo) (equal cambiar-a 'rojo)) '(en-amarillo "cambiar-a-amarillo-intermitente")) 
      ((and(equal color-actual 'en-amarillo-intermitente) (equal cambiar-a 'rojo)) '(en-amarillo-intermitente "cambiar-a-rojo")) 
      (t (list color-actual 'accion-por-defecto))
    )
  )

  ;; REQUERIMIENTO 2 - Actualizado a Extension 1
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
      ((<= resto 212)'en-verde)
    ((<= resto 215)'en-verde-intermitente)
    ((<= resto 221)'en-amarillo)
      (t 'en-amarillo-intermitente)
    )
  )
)

;; REQUERIMIENTO 4 - Actualizado a Extension 1
;; ========================================================
;; FUNCIÓN: duracion-ciclo
;; NATURALEZA: Pura (No produce efectos secundarios y siempre devuelve el mismo resultado)
;; ESTRATEGIA: Función aritmética simple
;; IMPACTO: No destructiva
;; =======================================================
(defun duracion-ciclo(duracion-rojo duracion-amarillo duracion-verde rojo-intermitente amarillo-intermitente verde-intermitente)
  (+ duracion-rojo duracion-amarillo duracion-verde rojo-intermitente amarillo-intermitente verde-intermitente)
)

;; REQUERIMIENTO 6 - Actualizado a Extension 1

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
|#


;; ============================================================================
;; ITERACIÓN 2 - EXTENSIÓN 2: PERSISTENCIA DE DATOS
;; ============================================================================
;; FUNCION: informe
;; NATURALEZA: Impura (Efecto secundario: crea y escribe datos en un archivo físico externo)
;; ESTRATEGIA: Funciones de orden superior (mapcar) combinadas con macros de E/S (with-open-file)
;; IMPACTO: No destructiva (Procesa la lista de datos sin alterar la estructura original)
;; ============================================================================
(defun informe (datos)
  (with-open-file (stream "informe-ejecucion-semaforo.txt" 
                          :direction :output 
                          :if-exists :supersede        
                          :if-does-not-exist :create)  
    (format stream "Informe de Ejecución del Sistema Semafórico~%")
    (format stream "=========================================~%")
    
    (mapcar #'(lambda (registro)
                (format stream "~A - Transición: ~A → ~A~%" 
                        (first registro)    
                        (second registro)   
                        (third registro)))  
            datos)
    
    (format stream "~% --- Fin del Informe ---")
    nil)
)

;; ============================================================================
;; FASE 2 - CL-JSON
;; ============================================================================

;; ========================================================
;; FUNCIÓN: cargar-configuracion
;; NATURALEZA: Impura (lee informacion desde un archivo externo)
;; ESTRATEGIA: Manejo de archivos y decodificación JSON
;; IMPACTO: No destructiva
;; ========================================================
(defun cargar-configuracion()
  (with-open-file (stream "config.json" :direction :input)
    (let ((contenido (make-string (file-length stream))))
      (read-sequence contenido stream)
      (mapcar (lambda (par)
                (list (car par) (cdr par)))
              (json:decode-json-from-string contenido)))))

;; ========================================================
;; FUNCIÓN: obtener-tiempo
;; NATURALEZA: Pura
;; ESTRATEGIA: Funcion de Orden Superior (find-if y lambda)
;; IMPACTO: No destructiva
;; ========================================================
(defun obtener-tiempo(color configuracion)
  (second
   (find-if (lambda (par)
              (equal (first par) color))
            configuracion)))
;;el uso correcto es (obtener-tiempo :<color> (cargar-configuracion))

;; ========================================================
;; FUNCIÓN: timer-json
;; NATURALEZA: Pura
;; ESTRATEGIA: Condicional simple
;; IMPACTO: No destructiva
;; ========================================================
(defun timer-json(tiempo-unix configuracion)
  (let* ((rojo (obtener-tiempo :rojo configuracion))
         (verde (obtener-tiempo :verde configuracion))
         (amarillo (obtener-tiempo :amarillo configuracion))
         (total (+ rojo verde amarillo))
         (resto (mod tiempo-unix total)))
    (cond
      ((< resto rojo) 'en-rojo)
      ((< resto (+ rojo verde)) 'en-verde)
      (t 'en-amarillo))))

;; ========================================================
;; FUNCIÓN: duracion-ciclo-json
;; NATURALEZA: Pura
;; ESTRATEGIA: Función aritmettica simple
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo-json(configuracion)
  (+ (obtener-tiempo :rojo configuracion)
     (obtener-tiempo :verde configuracion)
     (obtener-tiempo :amarillo configuracion)))

;; ========================================================
;; FUNCIÓN: ciclos-por-tiempo-json
;; NATURALEZA: Pura
;; ESTRATEGIA: Función aritmetica simple
;; IMPACTO: No destructiva
;; ========================================================
(defun ciclos-por-tiempo-json(minutos configuracion)
  (nth-value 0
    (floor (/ (* minutos 60) (duracion-ciclo-json configuracion)))))

;; ========================================================
;; FUNCIÓN: distribucion-porcentual-json
;; NATURALEZA: Pura
;; ESTRATEGIA: Función aritmetica simple
;; IMPACTO: No destructiva
;; ========================================================
(defun distribucion-porcentual-json(configuracion)
  (let* ((rojo (obtener-tiempo :rojo configuracion))
         (amarillo (obtener-tiempo :amarillo configuracion))
         (verde (obtener-tiempo :verde configuracion))
         (total (+ rojo amarillo verde)))
    (list
     (list 'porcentaje-rojo
           (* (/ rojo total) 100.0))
     (list 'porcentaje-amarillo
           (* (/ amarillo total) 100.0))
     (list 'porcentaje-verde
           (* (/ verde total) 100.0)))))