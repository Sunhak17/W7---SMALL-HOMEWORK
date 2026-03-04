import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../library/view_model/library_view_model.dart';
import '../../../../model/songs/song.dart';
import '../../../theme/theme.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();

    return Container(
      color: viewModel.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: viewModel.songs.length,
              itemBuilder: (context, index) {
                final song = viewModel.songs[index];
                return SongTile(
                  song: song,
                  isPlaying: viewModel.isPlaying(song),
                  onTap: () {
                    viewModel.play(song);
                  },
                );
              },
            ),
          ),
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
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
