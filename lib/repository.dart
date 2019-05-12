import 'dart:async';

import 'package:booksky/models.dart';
import 'package:booksky/home/bloc/HomePageState.dart';

import 'package:http/http.dart' as http;

class Repository {
  Future<HomePageState> getBooks(String query) {



    return Future.delayed(Duration(seconds: 2),
        () => HomePageStateError(message: "Falha de conexão"));
  }
}
