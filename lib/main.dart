import 'package:flutter/material.dart';

import 'page/home.dart';
import 'page/login.dart';
import 'page/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(title: 'Home Page'),
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return new MyCustomRoute(
              builder: (_) => HomePage(),
              settings: settings,
            );

          case '/login':
            return new MyCustomRoute(
              builder: (_) => LoginPage(),
              settings: settings,
            );
          case '/list':
            return new MyCustomRoute(
              builder: (_) => ListPage(),
              settings: settings,
            );
        }
      },
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
