import sys
import random
import argparse

parser = argparse.ArgumentParser(description='Genera juegos de prueba al azar')
parser.add_argument('version', metavar='version', type=int, choices=range(0,5), help='Numero de extension de 0 a 4')
parser.add_argument('habitaciones', metavar='habitaciones', type=int, help='Numero de habitaciones')
parser.add_argument('reservas', metavar='reservas', type=int, help='Numero de reservas')

args=parser.parse_args()

ext=args.version
hab=args.habitaciones
res=args.reservas
file = open('RandomInstanceExt'+str(ext)+".pddl", 'w+')
#head
head="\
(define (problem basic)\n\
  (:domain hotel)"
#Objects
objects="  (:objects"
for i in range (1,res+1):
    objects+= ' r'+str(i)
objects+=" - reserva\n    "
for i in range (1,hab+1):
    objects+= ' h'+str(i)
objects +=" - habitacion\n  )\n"
#init
init="  (:init\n"
    #habitaciones
for i in range (1,hab+1):
    init+="\
        (= (idhab h"+str(i)+") "+str(i)+")\n\
        (= (capacidad h"+str(i)+") "+str(random.randint(1,4))+")\n"
    if ext is 2:
        init+="\
        (= (orienthab h"+str(i)+") "+str(random.randint(0,4))+")\n"
    #reservas
for i in range(1,res+1):
    init+="\n\
        (pendiente r"+str(i)+")\n\
        (= (idres r"+str(i)+") "+str(i)+")\n\
        (= (npers r"+str(i)+") "+str(random.randint(1,4))+")\n"
    r1=random.randint(1,30)
    r2=random.randint(1,30)
    if r1<r2:
        ini=r1
        fi=r2
    else:
        ini=r2
        fi=r1
    init+="\
        (= (dini r"+str(i)+") "+str(ini)+")\n\
        (= (dfi r"+str(i)+") "+str(fi)+")\n"
    if ext is 2:
        init+="\
        (= (orientres r"+str(i)+") "+str(random.randint(0,4))+")\n"
if ext is not 0:
    init+="\n        (= (coste) 0)\n"
if ext in [3,4]:
    init+="        (= (nplazas) 0)\n"
if ext is 4:
    init+="        (= (nhab) 0)\n"

init+="\
      )\n"
#tail
tail="\
  (:goal\n\
    (forall (?x - reserva )\n\
        (not(pendiente ?x))\n\
    )\n\
  )\n"
if ext in [1,2]:
  tail+="  (:metric minimize (coste))\n"
elif ext is 3:
  tail+="  (:metric minimize (+(* 10 (nplazas))(coste)))\n"
elif ext is 4:
  tail+="  (:metric minimize (+ (+(* 10 (nplazas)) (* 100 (nhab)) )(coste)) )\n"


tail+=")\n"


file.write(head+objects+init+tail)
print('Archivo "RandomInstanceExt'+str(ext)+'.pddl" creado con exito')
