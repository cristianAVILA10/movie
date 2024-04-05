import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:movie_2/Models/movie.dart';
import 'package:movie_2/Models/now_playing_movie.dart';

class MovieProvider extends ChangeNotifier {
  String _apiKey = '6ae4ba0ab41510d8ce91e355e0b6a511';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> listNowPlayingMovie = [];

  MovieProvider() {
    this.getOnDisplayNowPlayingMovie();
  }

  getOnDisplayNowPlayingMovie() async {
    Uri url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    Response response = await http.get(url);
    NowPlayingMovie nowPlayingMovie =
        NowPlayingMovie.fromRawJson(response.body);
    listNowPlayingMovie = nowPlayingMovie.results!;

    notifyListeners();
  }
}
