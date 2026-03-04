import '../../../model/songs/song.dart';

abstract class SongRepository {
  List<Song> fetchSongs();
  
  Song? fetchSongById(String id);
}
