import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../constants.dart' as CONSTANTS;
import '../utils.dart' as Utils;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _password;
  @override
  Widget build(BuildContext context) {
    String os = Platform.operatingSystem;
    String osString = Platform.isIOS ? '${os[0]}${os.substring(1).toUpperCase()}' : '${os[0].toUpperCase()}${os.substring(1)}';
    return Scaffold(
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 40.0),
                child: new TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '$osString Flutter Bootstrap',
                  ),
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: CONSTANTS.USERNAME_TIPS,
                  ),
                  onSaved: (val) {
                    _name = val;
                  },
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: CONSTANTS.PASSWORD_TIPS,
                ),
                obscureText: true,
                validator: (val) {
                  return val.length < 0 ? 'length error' : null;
                },
                onSaved: (val) {
                  _password = val;
                },
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
                        'Login',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Color(Utils.getColorHexFromStr('#ffffff'))),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
