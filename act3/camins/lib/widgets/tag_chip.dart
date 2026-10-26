import 'package:camins/styles/app_styles.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const TagChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppStyles.lightGreen, // Color verd clar de fondo
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Para que no ocupe todo el ancho
        children: [
          Icon(icon, size: 14, color: AppStyles.green),
          AppStyles.tinySeparator,
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppStyles.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
