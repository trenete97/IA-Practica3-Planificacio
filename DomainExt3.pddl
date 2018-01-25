(define (domain hotel)
  (:requirements :strips :fluents :typing :adl :equality)
  (:types habitacion reserva)
  (:functions
    ;para la habitacion
    (idhab ?x - habitacion)
    (capacidad ?x - habitacion)
    ;para la reserva
    (idres ?x - reserva)
    (npers ?x - reserva)
    (dini ?x - reserva)
    (dfi ?x - reserva)
    ;para optimizar
    (coste)
    (nplazas)
  )
  (:predicates
    (assignacion ?x - reserva ?y - habitacion)
    ;para indicar que falta por asignar una reserva
    (pendiente ?x - reserva)
  )
  ;(:action descarta :parameters (?x - reserva ?y - habitacion)
  ;  :precondition (and ( assignacion ?x ?y) (not (pendiente ?x)))
  ;  :effect (and (increase (coste) 2) (increase (nplazas) (- (npers ?x) (capacidad ?y))) (pendiente ?x) (not (assignacion ?x ?y)))
  ;)
  (:action descarta :parameters (?x - reserva )
    :precondition (pendiente ?x)
    ;increase cubico con los dias de la reserva
    :effect (and (not (pendiente ?x))
     (increase (coste) (* (* (- (dfi ?x) (dini ?x) ) (- (dfi ?x) (dini ?x))) (- (dfi ?x) (dini ?x) ) ))  )
  )
  (:action asigna :parameters (?x - reserva ?y - habitacion)
    :precondition (and
        (pendiente ?x)
        (<= (npers ?x) (capacidad ?y))
        (forall (?z - reserva)
          (or (not(assignacion ?z ?y))
            (or (> (dini ?z) (dfi ?x)) (> (dini ?x) (dfi ?z)))
          )
        )
      )
    :effect ( and ( assignacion ?x ?y) (not (pendiente ?x))
      (increase (coste) (* (- (dfi ?x) (dini ?x) ) (- (dfi ?x) (dini ?x))))
      (increase (nplazas)  (- (capacidad ?y) (npers ?x))  ) )
  )

)
