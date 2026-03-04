import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';
import '../../../states/settings_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final AppSettingsState appSettingsState;

  List<Song> _songs = [];

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
    required this.appSettingsState,
  });

  Future<void> init() async {
    _songs = await songRepository.fetchSongs();
    playerState.addListener(_onPlayerChanged);
    notifyListeners();
  }

  void _onPlayerChanged() {
    notifyListeners();
  }

  List<Song> get songs => _songs;
  Song? get currentSong => playerState.currentSong;
  bool isPlaying(Song song) => currentSong == song;
  Color get backgroundColor => appSettingsState.theme.backgroundColor;

  void play(Song song) {
    playerState.start(song);
  }

  void stop() {
    playerState.stop();
  }
}
