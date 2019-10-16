import 'dart:async';
import 'package:booksky/home/bloc/home_pages_state.dart';
import 'package:booksky/models.dart';
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
      return HomePageStateSuccess(books: books);
    } else {
      return HomePageStateError(message: "Falha na conexão");
    }
  }
}
