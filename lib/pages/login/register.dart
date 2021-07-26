import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/data/database-helper.dart';
import 'package:flutter_sqlite/models/user.dart';

import '../home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState  extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, _password;



  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Register"),
      color: Colors.green,
    );


    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: new InputDecoration(labelText: "Name"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Email"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit(){
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() async {
        _isLoading = true;
        form.save();
        var user = new OurUser(_name, _username, _password, null);
        var db = new DatabaseHelper();
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
              email: _username, password: _password);


          if (newUser !=null){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
          }
        }
        catch(e){
          print(e);
        }
        db.saveUser(user);
        _isLoading = false;
        Navigator.of(context).pushNamed("/login");
      });
    }
  }
}