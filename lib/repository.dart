import 'dart:async';
import 'package:booksky/models.dart';
import 'package:booksky/home/bloc/HomePageState.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class Repository {
// url apli
  final String baseURL = "https://www.googleapis.com/books/v1/volumes";

  Future<HomePageState> getBooks(String query) async {
    final url = "$baseURL?q=$query";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var body = response.body;
      var jsonData = converter.jsonDecode(body);
      var data = BooksApiModel.fromJson(jsonData);
      var books = data.items;
      return HomePageStateSuccess(books: data.items);
    } else {
      return HomePageStateError(message: "Falha na conexão");
    }
  }
}
