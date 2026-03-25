// song_repository_mock.dart

import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryMock implements SongRepository {
  final List<Song> _songs = [
    Song(
      id: 's1',
      title: 'Mock Song 1',
      artistId: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
      imageUrl: 'https://picsum.photos/200',
    ),
    Song(
      id: 's2',
      title: 'Mock Song 2',
      artistId: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: 'https://picsum.photos/201',
    ),
    Song(
      id: 's3',
      title: 'Mock Song 3',
      artistId: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: 'https://picsum.photos/202',
    ),
    Song(
      id: 's4',
      title: 'Mock Song 4',
      artistId: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: 'https://picsum.photos/203',
    ),
    Song(
      id: 's5',
      title: 'Mock Song 5',
      artistId: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: 'https://picsum.photos/204',
    ),
  ];

  @override
  Future<List<Song>> fetchSongs() async {
    return Future.delayed(Duration(seconds: 4), () {
      throw Exception("G3 and G4 the class is finished");
    });
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return Future.delayed(Duration(seconds: 4), () {
      return _songs.firstWhere(
        (song) => song.id == id,
        orElse: () => throw Exception("No song with id $id in the database"),
      );
    });
  }
}
