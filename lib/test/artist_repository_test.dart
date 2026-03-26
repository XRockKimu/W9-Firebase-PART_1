import '../data/repositories/artists/artist_repository.dart';
import '../data/repositories/artists/artist_repository_firebase.dart';
import '../model/artists/artist.dart';

void main() async {
  ArtistRepository artistRepository = ArtistRepositoryFirebase();

  print('Fetching artists...');
  List<Artist> artists = await artistRepository.fetchArtists();

  for (var artist in artists) {
    print(artist);
  }

  if (artists.isNotEmpty) {
    String firstId = artists.first.id;
    print('\nFetching artist by id: $firstId');
    Artist? artist = await artistRepository.fetchArtistById(firstId);
    print(artist);
  }
}
