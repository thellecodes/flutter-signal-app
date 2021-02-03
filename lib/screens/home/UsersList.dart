import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:signal/models/Models.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignalList(
      title: "Signal",
    );
  }
}

class SignalList extends StatefulWidget {
  SignalList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignalListState createState() => new _SignalListState();
}

class _SignalListState extends State<SignalList> {
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/users");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u['id'], u['name']);

      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() =>
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return new Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      print("tapped");
                    },
                    splashColor: getRandomColor(),
                    child: Ink(
                        child: ListTile(
                      leading: IconButton(
                          padding: EdgeInsets.all(5),
                          icon: CircleAvatar(
                            backgroundColor: getRandomColor(),
                            child: Text(
                              snapshot.data[index].name
                                  .substring(0, 2)
                                  .toUpperCase(),
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          onPressed: () {},
                          color: getRandomColor()),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(
                        '${snapshot.data[index].name} is on Signal',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      trailing: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Jan 16"),
                        ],
                      ),
                    )));
              },
            );
          }
        },
      ),
    );
  }
}
