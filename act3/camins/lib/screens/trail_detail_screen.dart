import 'package:camins/styles/app_styles.dart';
import 'package:camins/widgets/header_image.dart';
import 'package:camins/widgets/stat_item.dart';
import 'package:camins/widgets/tag_chip.dart';
import 'package:flutter/material.dart';

class TrailDetailScreen extends StatelessWidget {
  const TrailDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Aquí irán las zonas, de arriba abajo

            //Agrupa la cabecera y la ficha
            Stack(
              clipBehavior: Clip.none, //
              children: [
                // La Zona 2: Imagen de cabecera
                HeaderImage(),

                // Zona 3: La ficha de la ruta con sus estadísticas
                Positioned(
                  bottom: -30, // Ajuste hacia abajo para que sobresalga del HeaderImage
                  left: 16,
                  right: 16,
                  child: Card(
                    color: const Color.fromARGB(255, 249, 249, 247),
                    margin: EdgeInsets.zero,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: SizedBox(
                      height: 88,
                      child: Row(
                        children: [
                          // Expanded para que ocupen partes iguales
                          Expanded(
                            child: StatItem(
                              icon: Icons.route,
                              value: '9,4 km',
                              label: 'Distància',
                            ),
                          ),
                          Expanded(
                            child: StatItem(
                              icon: Icons.trending_up,
                              value: '620 m',
                              label: 'Desnivell',
                            ),
                          ),
                          Expanded(
                            child: StatItem(
                              icon: Icons.schedule,
                              value: '3 h 45',
                              label: 'Durada',
                            ),
                          ),
                          Expanded(
                            child: StatItem(
                              icon: Icons.terrain,
                              value: 'Moderada',
                              label: 'Dificultat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            // Zona 4: Sobre la ruta
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre la ruta',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppStyles.darkText,
                    ),
                  ),
                  AppStyles.smallSeparator,
                  Text(
                    'Una volta circular pel cor del circ de Colomers, amb una desena d\'estanys d\'origen glacial. El camí està ben senyalitzat i la pujada és constant però sense trams tècnics. Ideal per a finals de primavera i estiu.',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppStyles.greyText,
                      height: 1.5, // Interlineado 1.5
                    ),
                  ),
                  AppStyles.mediumSeparator,

                  Wrap(
                    spacing: 8, //
                    runSpacing: 8, //
                    children: [
                      TagChip(icon: Icons.loop, label: 'Circular'),
                      TagChip(icon: Icons.water, label: 'Estanys'),
                      TagChip(icon: Icons.pets, label: 'Gossos permesos'),
                      TagChip(icon: Icons.water_drop, label: 'Font d\'aigua'),
                      TagChip(icon: Icons.cabin, label: 'Refugi'),
                    ],
                  ),
                ],
              ),
            ),

            //Zona 5: Fotos de la ruta
            AppStyles.mediumSeparator,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título y "Veure-les totes"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fotos',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: AppStyles.darkText,
                        ),
                      ),
                      Text(
                        'Veure-les totes',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppStyles.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  AppStyles.smallSeparator,

                  // La graella de fotos
                  GridView.count(
                    crossAxisCount: 3, // 3 columnas
                    shrinkWrap:
                        true, // Obligatorio para que quepa en el ListView
                    physics: const NeverScrollableScrollPhysics(), // Quitamos el scroll propio de la graella
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      _buildPhoto('assets/images/lake.jpg'),
                      _buildPhoto('assets/images/forest.jpg'),
                      _buildPhoto('assets/images/meadow.jpg'),
                      _buildPhoto('assets/images/peaks.jpg'),
                      _buildPhoto('assets/images/sunset.jpg'),
                      _buildPhoto('assets/images/waterfall.jpg', isLast: true),
                    ],
                  ),
                ],
              ),
            ),

            AppStyles.bigSeparator,

            // ZONA 6: Etapes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Etapes',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppStyles.darkText,
                    ),
                  ),
                  AppStyles.smallSeparator,

                  // Lista de etapas
                  _buildEtapa(1, 'Banys de Tredòs', '3,4 km · 310 m', '0:00'),
                  _buildEtapa(
                    2,
                    'Refugi de Colomers',
                    '2,1 km · 240 m',
                    '1:10',
                  ),
                  _buildEtapa(3, 'Estany Major', '4,6 km · 310 m', '1:45'),
                  _buildEtapa(4, 'Estany Obago', '2,3 km · 150 m', '2:30'),
                  _buildEtapa(
                    5,
                    'Tornada als Banys',
                    '3,4 km · 50 m',
                    '3:45',
                    isLast: true,
                  ),
                ],
              ),
            ),

            AppStyles.bigSeparator,
          ],
        ),
      ),

      // bottomNavigationBar: aquí irá la barra inferior
      // ZONA 7
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, -2),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              // Textos de la izquierda (Punt de sortida)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Punt de sortida',
                      style: TextStyle(fontSize: 11, color: AppStyles.greyText),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Banys de Tredòs',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppStyles.darkText,
                      ),
                    ),
                  ],
                ),
              ),
              // Botón de descarga (icono)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.download, color: AppStyles.darkText),
              ),
              // Botón verde (Començar)
              FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppStyles.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(
                  Icons.navigation,
                  size: 18,
                  color: Colors.white,
                ),
                label: const Text(
                  'Començar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Funcion para construir cada foto de la grilla
Widget _buildPhoto(String imagePath, {bool isLast = false}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(imagePath, fit: BoxFit.cover),

        if (isLast)
          Container(
            color: Colors.black.withValues(alpha: 0.6), // Filtro oscuro
            alignment: Alignment.center,
            child: const Text(
              '+18',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    ),
  );
}

Widget _buildEtapa(
  int numero,
  String nom,
  String detall,
  String hora, {
  bool isLast = false,
}) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Círculo con el número
        Column(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppStyles.lightGreen,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                numero.toString(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppStyles.green,
                ),
              ),
            ),

            //La lìnea vertical que conecta los círculos
            if (!isLast)
              Expanded(child: Container(width: 2, color: AppStyles.lightGreen)),
          ],
        ),
        AppStyles.smallSeparator,

        // Nombre y detalle (usamos Expanded para que empuje la hora a la derecha)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nom,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppStyles.darkText,
                ),
              ),
              Text(
                detall,
                style: TextStyle(fontSize: 12, color: AppStyles.greyText),
              ),
            ],
          ),
        ),

        // Hora a la derecha
        Text(
          hora,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppStyles.darkText,
          ),
        ),
      ],
    ),
  );
}
