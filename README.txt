El programa testGen.py genera aleatoriamente juegos de prueba.

Para borrar todos los archivos generados por el programa, ejecutad:
find . -type f -name RandomInstanceExt\* -exec rm {} \;

Su usage es el siguiente(python3 testGen.py -h muestra el mismo mensaje):

python3 testGen.py [-h] version habitaciones reservas

Genera juegos de prueba al azar

positional arguments:
  version       Numero de extension de 0 a 4
  habitaciones  Numero de habitaciones
  reservas      Numero de reservas

optional arguments:
  -h, --help    show this help message and exit
