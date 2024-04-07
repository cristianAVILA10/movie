import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:movie_2/models/popular.dart';
import 'package:movie_2/models/now_popular.dart';

class PopularProvider extends ChangeNotifier{
  String _apiKey = '6ae4ba0ab41510d8ce91e355e0b6a511';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Popular> listNowPopulares = [];
  
  PopularProvider(){
    this.getOnDisplayNowPopular();
  }

  Future<void> getOnDisplayNowPopular() async {
    Uri url = Uri.https(
      _baseUrl,
      '3/movie/popular',
      {
        'api_key' : _apiKey,
        'language' : _language,
        'page' : '1'
      }
    );

    Response response = await http.get(url);
    NowPopular nowPopular = NowPopular.fromRawJson(response.body);
    listNowPopulares = nowPopular.results!;

    notifyListeners();
  }
}
