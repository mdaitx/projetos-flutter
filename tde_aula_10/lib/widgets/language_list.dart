import 'package:flutter/material.dart';

class LanguageList extends StatelessWidget {
  final List<String> languages;

  const LanguageList({
    super.key,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: languages.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE0E0E0),
                width: 0.5,
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              languages[index],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
        );
      },
    );
  }
}