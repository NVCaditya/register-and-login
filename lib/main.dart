import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/home_page.dart';
import 'package:flutter_sqlite/pages/login/login_page.dart';
import 'package:flutter_sqlite/pages/login/register.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs=await SharedPreferences.getInstance();
  var email=prefs.getString('email');


  print(email);

  // runApp(MaterialApp(home: email==null?LoginPage():HomePage(),));
  runApp( MaterialApp(

      initialRoute: email==null?'/login':'/home',
    title: 'Sqflite App',
    theme: new ThemeData(primarySwatch: Colors.teal),
    routes: routes,
  ),);}

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
};

// class MyApp extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context){
//
//    return new MaterialApp(

//      title: 'Sqflite App',
//      theme: new ThemeData(primarySwatch: Colors.teal),
//      routes: routes,
//    );
//  }
// }
