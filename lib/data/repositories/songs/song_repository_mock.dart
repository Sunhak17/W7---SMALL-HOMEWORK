// song_repository_mock.dart

import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryMock implements SongRepository {
  final List<Song> _songs = [
    Song(
      id: '101',
      title: 'Mock Song 1',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    Song(
      id: '102',
      title: 'Mock Song 2',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
  ];

  @override
  List<Song> fetchSongs() {
    return _songs;
  }

  @override
  Song? fetchSongById(String id) {
    try {
      return _songs.firstWhere((song) => song.id == id);
    } catch (_) {
      return null;
    }
  }
}
