import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';
import '../library/widgets/library_content.dart';
import '../library/view_model/library_view_model.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryViewModel(
        songRepository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
        appSettingsState: context.read<AppSettingsState>(),
      ),
      child: const LibraryContent(),
    );
  }
}
