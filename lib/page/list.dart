import 'package:flutter/material.dart';

import '../constants.dart' as CONSTANTS;

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: new Text(
          CONSTANTS.HOME,
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 20.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Flutter Bootstrap',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
