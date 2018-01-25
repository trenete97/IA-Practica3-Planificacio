(define (problem basic)
  (:domain hotel)
  (:objects r1 r2 r3 r4 r5 - reserva
    h1  - habitacion
  )
  (:init
    ;habitaciones
    (= (idhab h1) 1)
  ;  (= (idhab h2) 2)
    (= (capacidad h1) 1)
  ;  (= (capacidad h2) 4)
    ;reservas
    (= (idres r1) 1)
    (= (idres r2) 2)
    (= (idres r3) 3)
    (= (idres r4) 4)
    (= (idres r5) 5)
  
    (= (npers r1) 1)
    (= (npers r2) 1)
    (= (npers r3) 1)
    (= (npers r4) 1)
    (= (npers r5) 1)
    
    (= (dini r1) 1)
    (= (dfi r1) 10)

    (= (dini r2) 11)
    (= (dfi r2) 21)

    (= (dini r3) 22)
    (= (dfi r3) 25)

    (= (dini r4) 5)
    (= (dfi r4) 9)

    (= (dini r5) 7)
    (= (dfi r5) 8)
    ;;
    (pendiente r1)
    (pendiente r2)
    (pendiente r3)
    (pendiente r4)
    (pendiente r5)
    ;
    (= (nassig) 0)
  )
  (:goal
    (forall (?x - reserva )
     (not (pendiente ?x))
    )
  )
  (:metric minimize (nassig))
)
