import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../constants.dart' as CONSTANTS;
import '../utils.dart' as Utils;

import '../component/list.dart';
import '../component/logout.dart';

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

  @override
  Widget build(BuildContext context) {
    var _children = [
      ListComponent(),
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
      LogoutComponent(),
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
