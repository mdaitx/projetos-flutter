import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClearPressed;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Filtro',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF20B2AA),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              onChanged: onChanged,
            ),
          ),
          SizedBox(width: 12),
          ElevatedButton(
            onPressed: onClearPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9C27B0),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text('Limpar'),
          ),
        ],
      ),
    );
  }
}