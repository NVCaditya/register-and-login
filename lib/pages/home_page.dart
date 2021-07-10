
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/components/msg_list.dart';
import 'package:flutter_sqlite/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';


void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
 final MssgList mssg=MssgList();

  @override
  Widget build(BuildContext context) {


  return Scaffold(
    drawer: Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30,left: 5),
            child: GestureDetector(
              child: Text('PROFILE',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=> ProfilePage() ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 5),
            child: GestureDetector(child: Text('LOG OUT',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),),
                    onTap: ()async
                   { SharedPreferences prefs = await SharedPreferences.getInstance();
                     prefs.remove('email');
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
  },


            ),
          ),
        ],
      ),
    ),
    appBar: AppBar(

      backgroundColor: Colors.deepPurple,
      title: Text('Inbox'),
      actions: [

        IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
      ],

    ),

      body: ListView(
      children: mssg.mssgList,
      ),




    floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
    ),
      );
  }
}






