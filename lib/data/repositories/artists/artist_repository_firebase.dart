import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https('flutter-song-3de99-default-rtdb.firebaseio.com', '/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistJson = json.decode(response.body);
      return artistJson.entries.map((entry) => ArtistDto.fromJson(entry.key, entry.value)).toList();
    } else {
      throw Exception('Failed to load artists');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
     final Uri artistUri = Uri.https('flutter-song-3de99-default-rtdb.firebaseio.com', '/artists/$id.json');
     final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      if (response.body == 'null') return null;
      Map<String, dynamic> artistJson = json.decode(response.body);
      return ArtistDto.fromJson(id, artistJson);
    } else {
      throw Exception('Failed to load artist');
    }
  }
}
