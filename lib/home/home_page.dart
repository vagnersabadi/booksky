import 'package:booksky/home/bloc/HomePageBloc.dart';
import 'package:booksky/repository.dart';
import 'package:booksky/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  HomePageBloc _bloc;

  List<String> categorias = [
    "Android",
    "Java",
    "Java Script",
    "Flutter",
    "Ionic",
    "PHP"
  ];

  List<String> tmp = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _bloc = HomePageBloc(repository: Repository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 42, left: 24),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(
                        "Browser ",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Recommended",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categorias.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext c, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: GestureDetector(
                          onTap: () {
                            _selectedIndex = index;
                            setState(() {});
                          },
                          child: Chip(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            backgroundColor: index == _selectedIndex
                                ? Colors.blue
                                : Colors.grey[200],
                            label: Text(
                              categorias.elementAt(index),
                              style: TextStyle(
                                  color: index == _selectedIndex
                                      ? Colors.white
                                      : Colors.grey[500]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: categorias.length,
                      itemBuilder: (context, index) {
                        return BookWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
