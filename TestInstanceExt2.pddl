(define (problem basic)
  (:domain hotel)
  (:objects r1 r2 - reserva
    h1  - habitacion
  )
  (:init
    ;habitaciones
    (= (idhab h1) 1)
  ;  (= (idhab h2) 2)
    (= (capacidad h1) 1)
    (= (orienthab h1) 0)
  ;  (= (capacidad h2) 4)
    ;reservas
    (= (idres r1) 1)
    (= (idres r2) 2)
  ;  (= (idres r3) 3)
  ;  (= (idres r4) 4)
  ;  (= (idres r5) 5)
    
    (= (npers r1) 1)
    (= (npers r2) 1)
  ;  (= (npers r3) 1)
  ;  (= (npers r4) 1)
  ;  (= (npers r5) 1)
    
    (= (dini r1) 1)
    (= (dfi r1) 10)
    (= (orientres r1) 0)
    (= (dini r2) 12)
    (= (dfi r2) 21)
    (= (orientres r2) 2)
  ;  (= (dini r3) 22)
  ;  (= (dfi r3) 25)

  ;  (= (dini r4) 5)
  ;  (= (dfi r4) 9)

  ;  (= (dini r5) 7)
  ;  (= (dfi r5) 8)
    ;;
    (pendiente r1)
    (pendiente r2)
  ;  (pendiente r3)
  ;  (pendiente r4)
  ;  (pendiente r5)
    ;
    (= (coste) 0)
  )
  (:goal
    (forall (?x - reserva )
     (not (pendiente ?x))
    )
  )
  (:metric minimize (coste))
)
