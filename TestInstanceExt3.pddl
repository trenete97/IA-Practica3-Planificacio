(define (problem basic)
  (:domain hotel)
  (:objects r1 r2 r3 r4 r5 - reserva
    h1  - habitacion
  )
  (:init
    ;habitaciones
    (= (idhab h1) 1)
  ;  (= (idhab h2) 2)
    (= (capacidad h1) 4)
  ;  (= (capacidad h2) 4)
    ;reservas
    (= (idres r1) 1)
    (= (idres r2) 2)
    (= (idres r3) 3)
    (= (idres r4) 4)
    (= (idres r5) 5)
 
    (= (npers r1) 1)
    (= (npers r2) 2)
    (= (npers r3) 2)
    (= (npers r4) 1)
    (= (npers r5) 3)
  
    (= (dini r1) 1)
    (= (dfi r1) 10)

    (= (dini r2) 11)
    (= (dfi r2) 21)

    (= (dini r3) 1)
    (= (dfi r3) 10)

    (= (dini r4) 26)
    (= (dfi r4) 28)

    (= (dini r5) 28)
    (= (dfi r5) 29)
    ;;
    (pendiente r1)
    (pendiente r2)
    (pendiente r3)
    (pendiente r4)
    (pendiente r5)
    ;
    (= (coste) 0)
    (= (nplazas) 0)
  )
  (:goal
    (forall (?x - reserva )
     (not (pendiente ?x))
    )
  )
  (:metric minimize (+(* 10 (nplazas))(coste)))
)
