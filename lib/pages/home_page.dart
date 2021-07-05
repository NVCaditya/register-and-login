
import 'package:flutter/material.dart';



void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


  return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          color: Colors.teal),
          child: Text('welcome',style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800
          ),

          ),
        ),
      ),
    );
  }
}






