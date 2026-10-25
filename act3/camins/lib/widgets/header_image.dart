import 'package:camins/styles/app_styles.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Imagen de fondo
        Image.asset(
          'assets/images/header.jpg',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // 2. Gradiente para oscurecer la parte inferior
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color.fromARGB(243, 0, 0, 0),
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
        ),
        // 3. Textos (Región, Título, Valoración)
        Positioned(
          bottom: 24,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cápsula de Región
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppStyles.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'PIRINEU · VAL D\'ARAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppStyles.smallSeparator,
              // Título
              Text(
                'Circuit dels Estanys de\nColomers',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              AppStyles.smallSeparator,
              // Valoración
              Row(
                children: [
                  Icon(Icons.star, color: AppStyles.orange, size: 16),
                  AppStyles.tinySeparator,
                  Text(
                    '4,8',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  AppStyles.tinySeparator,
                  Text(
                    '(126 opinions)',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        // 0. Reto: Botones superiores
        Positioned(
          top: 40, // Ajusta esto para que no choque con la barra de estado del móvil
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botón de volver atrás (izquierda)
              _buildIconButton(Icons.arrow_back_ios_new),
              // Contenedor de la derecha (compartir y favorito)
              Row(
                children: [
                  _buildIconButton(Icons.share_outlined),
                  AppStyles.smallSeparator,
                  _buildIconButton(Icons.favorite_border),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3), // Fondo semitransparente
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
