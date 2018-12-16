
import 'package:flutter/material.dart';

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
    return Scaffold(
        body: new Container(
          padding: const EdgeInsets.all(36.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Your Name',
                  ),
                  onSaved: (val) {
                    _name = val;
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (val) {
                    return val.length < 4 ? 'length error' : null;
                  },
                  onSaved: (val) {
                    _password = val;
                  },
                ),
                FlatButton(
                  child: Text('login'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }
                )
              ],
            ),
          ),
        ),
    );
  }
}