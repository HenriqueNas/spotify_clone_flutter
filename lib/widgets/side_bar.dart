import 'package:flutter/material.dart';

import '../config/spotify_icons.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(
                  Spotify.spotify,
                  color: Colors.white,
                  size: 40,
                ),
                _Separator(value: 8),
                Text(
                  'Spotify',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          const _Separator(value: 16),
          const _SideBarTile(
            icon: Spotify.home,
            text: 'Home',
          ),
          const _SideBarTile(
            icon: Spotify.search,
            text: 'Search',
          ),
          const _SideBarTile(
            icon: Spotify.note_beamed,
            text: 'Your Library',
          ),
          const _Separator(value: 32),
          const _SideBarTile(
            icon: Spotify.plus_squared,
            text: 'Create Playlist',
          ),
          const _SideBarTile(
            icon: Spotify.heart,
            text: 'Liked Songs',
          ),
          const _SideBarTile(
            icon: Icons.podcasts_rounded,
            text: 'Your Episodes',
          ),
          const Divider(color: Colors.white38),
          const _Playlists(),
        ],
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator({this.value = 12});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value, width: value);
  }
}

class _SideBarTile extends StatefulWidget {
  const _SideBarTile({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  State<_SideBarTile> createState() => _SideBarTileState();
}

class _SideBarTileState extends State<_SideBarTile> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _isHovering ? Colors.white12 : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.white, size: 22),
            const _Separator(value: 16),
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Playlists extends StatelessWidget {
  const _Playlists();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 80,
        separatorBuilder: (_, __) => const _Separator(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              'Playlist $index',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
