import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:signal/screens/home/UsersList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Signal",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF000000)),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  color: Color(0xFF000000),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(MaterialCommunityIcons.dots_vertical),
                  color: Color(0xFF000000),
                  iconSize: 20,
                  onPressed: () {},
                )
              ],
            ),
            body: UsersList(),
            floatingActionButton:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                child: Icon(
                  Icons.photo,
                  color: Colors.black87,
                ),
                onPressed: () {},
                heroTag: null,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 12,
              ),
              FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => {},
                heroTag: null,
              )
            ]),
          ),
        ));
  }
}
