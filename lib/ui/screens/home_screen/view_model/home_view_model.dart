import 'package:flutter/material.dart';

import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../data/repositories/songs/user_history_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';
import '../../../states/settings_state.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final UserHistoryRepository userHistoryRepository;
  final PlayerState playerState;
  final AppSettingsState appSettingsState;

  List<Song> _recentSongs = [];
  List<Song> _recommendedSongs = [];

  HomeViewModel({
    required this.songRepository,
    required this.userHistoryRepository,
    required this.playerState,
    required this.appSettingsState,
  });

  Future<void> init() async {
    final recentIds = userHistoryRepository.fetchRecentSongIds();
    final allSongs = await songRepository.fetchSongs();

    _recentSongs = allSongs
        .where((song) => recentIds.contains(song.id))
        .toList();

    _recommendedSongs = allSongs
        .where((song) => !recentIds.contains(song.id))
        .toList();

    playerState.addListener(_onPlayerChanged);

    notifyListeners();
  }

  void _onPlayerChanged() {
    notifyListeners();
  }

  List<Song> get recentSongs => _recentSongs;
  List<Song> get recommendedSongs => _recommendedSongs;
  Song? get currentSong => playerState.currentSong;
  bool isPlaying(Song song) => currentSong == song;
  Color get backgroundColor => appSettingsState.theme.backgroundColor;


  void play(Song song) {
    playerState.start(song);
    userHistoryRepository.addSongToList(song.id);
  }

  void stop() {
    playerState.stop();
  }
}
