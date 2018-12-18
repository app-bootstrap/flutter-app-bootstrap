import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../constants.dart' as CONSTANTS;
import '../utils.dart' as Utils;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  var a = WebviewScaffold(
    url: "https://www.youku.com",
    hidden: true,
  );

  var b = WebviewScaffold(
    url: "https://www.baidu.com",
    hidden: true,
  );
  @override
  Widget build(BuildContext context) {
    String os = Platform.operatingSystem;
    String osString = '${os[0].toUpperCase()}${os.substring(1)}';

    final List<Widget> _children = [
      a,
      b,
      WebviewScaffold(
        url: CONSTANTS.TEST_URL,
        hidden: true,
        withLocalStorage: true,
      ),
      WebviewScaffold(
        url: CONSTANTS.TEST_URL,
        hidden: true,
        withLocalStorage: true,
      ),
    ];
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
      body: _children[_currentIndex],
      /*
       new Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$osString Flutter Bootstrap',
                                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.black
                    ),
            ),
            new Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 80.0),
                decoration: new BoxDecoration(
                  color: Color(Utils.getColorHexFromStr(CONSTANTS.COLOR_1)),
                  borderRadius: new BorderRadius.circular(4.0),
                ),
                child: FlatButton(
                  child: Text(
                    'list',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Color(Utils.getColorHexFromStr('#ffffff'))
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/list');
                  }
                )
              )
          ],
        ),
      ),
      */

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(CONSTANTS.HOME)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text(CONSTANTS.WEBVIEW)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text(CONSTANTS.TEST_TITLE)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(CONSTANTS.PERSONAL)),
        ],
        currentIndex: _currentIndex,
        fixedColor: Color(Utils.getColorHexFromStr(CONSTANTS.COLOR_2)),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
