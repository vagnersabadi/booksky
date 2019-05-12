import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HomePageEvent extends Equatable {
  HomePageEvent([List tmp = const []]) : super(tmp);
}

/**
 * Filtro passando uma query
 */
class HomePageEventSearch extends HomePageEvent {
  final String query;
  HomePageEventSearch({@required this.query});

  @override
  String toString() => "HomePageEventSearch";
}
