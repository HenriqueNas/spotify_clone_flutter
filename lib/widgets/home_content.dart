import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_flutter/config/spotify_icons.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF181818),
            Color(0xFF000000),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Spotify.left_open, size: 18),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(16),
                shape: const CircleBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Spotify.right_open, size: 18),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(16),
                shape: const CircleBorder(),
              ),
            ),
          ],
        ),
        Container(
          width: 160,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Placeholder(
                fallbackHeight: 22,
                fallbackWidth: 22,
              ),
              Text(faker.person.firstName()),
              const Icon(Spotify.down_dir, size: 16)
            ],
          ),
        ),
      ],
    );
  }
}
