import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';
import '../../../../model/songs/song.dart';
import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Container(
      color: viewModel.backgroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Text("Home", style: AppTextStyles.heading),
            ),
            const SizedBox(height: 50),
            
            Text(
              "Your recent songs",
              style: AppTextStyles.label,
            ),
            const SizedBox(height: 16),
            ...viewModel.recentSongs.map((song) => SongTile(
              song: song,
              isPlaying: viewModel.isPlaying(song),
              onTap: () {
                viewModel.play(song);
              },
            )),
            
            const SizedBox(height: 32),
            
            Text(
              "You might also like",
              style: AppTextStyles.label,
            ),
            const SizedBox(height: 16),
            ...viewModel.recommendedSongs.map((song) => SongTile(
              song: song,
              isPlaying: viewModel.isPlaying(song),
              onTap: () {
                viewModel.play(song);
              },
            )),
          ],
        ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
