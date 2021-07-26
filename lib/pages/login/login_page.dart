import 'package:flutter/material.dart';
import 'package:flutter_sqlite/data/database-helper.dart';
import 'package:flutter_sqlite/models/user.dart';
import 'package:flutter_sqlite/pages/home_page.dart';
import 'package:flutter_sqlite/pages/login/login_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../login_with_number.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  final _auth = FirebaseAuth.instance;


  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");

  }

  void _submit() async{SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', _presenter.toString());


  // Navigator.pushReplacement(context,
  //     MaterialPageRoute(builder: (BuildContext _ctx)=>HomePage()));
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.green,
    );
    var registerBtn = new RaisedButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: _register,
      child: new Text("Register"),
      color: Colors.green,
    );
    var phnumBtn = new RaisedButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneNumberLogin()));},
      child: new Text("login with phone number"),
      color: Colors.green,
    );
    var loginForm =  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(labelText: "Email"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: loginBtn),

        registerBtn,
        phnumBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(OurUser user) async {
    // TODO: implement onLoginSuccess
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
    _showSnackBar("user not registered");
    }
    setState(() {
      _isLoading = false;
    });
    if(user.flaglogged == "logged"){
      print("Logged");
      Navigator.of(context).pushNamed("/home");
    }else{
      print("Not Logged");
    }
  }
}
