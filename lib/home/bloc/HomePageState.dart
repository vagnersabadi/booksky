import 'package:booksky/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  HomePageState([List tmp = const []]) : super(tmp);
}

class HomePageStateLoading extends HomePageState {
  @override
  String toString() => "HomePageStateLoading";
}

class HomePageStateSuccess extends HomePageState {
  final List<Books> books;
  HomePageStateSuccess({@required this.books});

  @override
  String toString() => "HomePageStateSuccess";
}

class HomePageStateError extends HomePageState {
  final String message;

  HomePageStateError({@required this.message});

  @override
  String toString() => "HomePageStateError";
}
