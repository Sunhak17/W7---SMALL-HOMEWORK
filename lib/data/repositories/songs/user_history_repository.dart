class UserHistoryRepository {
  final List<String> _recentSongIds = [];

  List<String> fetchRecentSongIds() {
    return List.from(_recentSongIds); 
  }

  void addSongToList(String songId) {
    _recentSongIds.remove(songId); 
    _recentSongIds.insert(0, songId);
    
    if (_recentSongIds.length > 3) {
      _recentSongIds.removeLast(); 
    }
  }
}
