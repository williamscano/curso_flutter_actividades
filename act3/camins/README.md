# camins

Aplicación #2 "Camins" del curso de Flutter

# Zona2

Me he arriesgado a crear un widget HeaderImage propio para no meter todo el código en detail_screen (el Stack, el gradiente) esto me parece lo más limpio y poder reutilizarlo.

Luego, lo que parecía fácil se hizo difícil poder encajar la imagen al ancho de pantalla (solucionado con doublue.infinity) y oscurecer la imagen hacia abajo (solucionado con stops)

# Zona3

Para repartir el espacio de forma equitativa, no lo conseguì hasta que usé Expanded.

La tentación copiar y pegar era una opción rápida pero no limpia; he entendido el reto de crear el el widget StatItem con parámetros.

# Zona4

Intentaba poner las etiquetas en un Row y me daba error de Overflow (la franja amarilla y negra que explicaste en clase) hasta que le puse un Wrap; y lo ponías en la guía (pagina 7) jejejeje.

Crear el TagChip me ayudó a entender para pasar los estilos de cada cápsula por parámetros.

# Zona5

Para las fotos, me compliqué un poco con GridView para que funcione con SingleChilScrollView. me daba error de altura, solución... shrinkWrap: true y physics: NeverScrollableScrollPhysics(), tal como está en el archivo. Usé la función auxiliar \_buildPhoto que envuelve la imagen en un ClipRRect para darle las esquinas redondeadas.

# Zona 6

Para las etapas, creé una función auxiliar \_buildEtapa para no repetir el código 5 veces.

# Zona 7

La barra inferior fue sencilla gracias a la propiedad bottomNavigationBar del Scaffold

# Reto

1. Botones Redondos; no se pintaban... solución pornerlo al final del Stack, lo había puesto al comienzo.

2. Para superponer la ficha, tuve que utilizar Stack y luego posicionarlo con nùmeros negativos en el bottom.

3. Igual utilicé Stack para superponer el +18 en la ùltima foto; y pasar por parámetro booleana para saber cuando es la ùltima foto.

4. Esta me costó más... al principio intentaba usar un Container fijo, pero no se adaptaba al contenido. luego descubrí que envolviendo la Row en un IntrinsicHeight y usar un Expanded dentro de la columna del círculo, me permitió estirar la lìnea hasta la altura de los textos, excepto en la última etapa, que controlé con un parámetro isLast, igual que en la foto.
