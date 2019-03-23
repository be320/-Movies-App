import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final client = new http.Client();
final String url='https://api.themoviedb.org/3/movie/now_playing?api_key=31521ab741626851b73c684539c33b5a';

Future<Map<String,dynamic>> getJson() async {
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
