import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        color: Color(0xFF181818),
        border: Border(
          top: BorderSide(
            color: Color(0xFF282828),
            width: 1,
          ),
        ),
      ),
    );
  }
}
