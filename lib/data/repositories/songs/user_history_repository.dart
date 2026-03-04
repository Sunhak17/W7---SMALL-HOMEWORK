class UserHistoryRepository {
  final List<String> _recentSongIds = ['1', '2']; 

  List<String> fetchRecentSongIds() {
    return List.from(_recentSongIds); 
  }

  void addSongToList(String songId) {
    _recentSongIds.insert(0, songId);
  }
}
