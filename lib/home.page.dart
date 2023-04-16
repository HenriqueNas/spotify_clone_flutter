import 'package:flutter/material.dart';

import 'widgets/footer.dart';
import 'widgets/home_content.dart';
import 'widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SideBar(),
                    Expanded(child: const HomeContent()),
                  ],
                ),
              ),
              const Footer(),
            ],
          );
        },
      ),
    );
  }
}
