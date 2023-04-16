import 'package:flutter/material.dart';

import '../config/spotify_icons.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF181818),
        border: Border(
          top: BorderSide(
            color: Color(0xFF282828),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ContentInfo(),
          _PlayerActions(),
          _SystemControls(),
        ],
      ),
    );
  }
}

class _ContentInfo extends StatefulWidget {
  const _ContentInfo();

  @override
  State<_ContentInfo> createState() => _ContentInfoState();
}

class _ContentInfoState extends State<_ContentInfo> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: const Placeholder(),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top 50 Global',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Spotify',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(width: 32),
        IconButton(
          onPressed: () => setState(() => _liked = !_liked),
          icon: Icon(
            _liked ? Spotify.heart : Spotify.heart_empty,
            color: _liked ? Colors.green : Colors.white,
          ),
        ),
      ],
    );
  }
}

class _PlayerActions extends StatelessWidget {
  const _PlayerActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Spotify.shuffle)),
            IconButton(onPressed: () {}, icon: Icon(Spotify.to_start)),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Spotify.play_1, color: Color(0xFF181818)),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                backgroundColor: Colors.white,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Spotify.to_end)),
            IconButton(onPressed: () {}, icon: Icon(Spotify.loop)),
          ],
        ),
        Row(
          children: [
            Text(
              '2:10',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 300,
              child: LinearProgressIndicator(
                value: 0.5,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '4:20',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SystemControls extends StatefulWidget {
  const _SystemControls();

  @override
  State<_SystemControls> createState() => _SystemControlsState();
}

class _SystemControlsState extends State<_SystemControls> {
  double _sound = 0.6;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Spotify.list)),
        IconButton(onPressed: () {}, icon: Icon(Spotify.monitor)),
        IconButton(
          onPressed: () => setState(() => _sound = _sound == 0 ? 0.6 : 0),
          icon: Icon(
            _sound == 0 //
                ? Spotify.mute
                : Spotify.sound,
          ),
        ),
        SizedBox(
          width: 120,
          child: Slider(
            value: _sound,
            onChanged: (value) => setState(() => _sound = value),
            activeColor: Colors.white,
            inactiveColor: Colors.white.withOpacity(0.2),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Spotify.resize_full)),
      ],
    );
  }
}
