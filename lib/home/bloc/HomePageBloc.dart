import 'package:bloc/bloc.dart';
import 'package:booksky/home/bloc/HomePageEvent.dart';
import 'package:booksky/home/bloc/HomePageState.dart';
import 'package:booksky/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  final Repository repository;

  HomePageBloc({@required this.repository});

  @override
  HomePageState get initialState => HomePageStateLoading();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    if (event is HomePageEventSearch) {
      yield HomePageStateLoading();
      
      var query = event.query;
      var booksResult = await repository.getBooks(query);
      yield booksResult;

       
    }
  }

  
}
