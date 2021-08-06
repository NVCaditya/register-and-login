
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/components/msg_list.dart';
import 'package:flutter_sqlite/pages/country_state_dropdown.dart';
import 'package:flutter_sqlite/pages/experiment_page.dart';
import 'package:flutter_sqlite/pages/login/login_page.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'weather_page.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final MssgList mssg=MssgList();
 double latitude;
 double longitude;
 var temperature;
 var condition;
 var city;

 final _auth = FirebaseAuth.instance;
 User loggedInUser;

@override
  void initState() {

    super.initState();
    getCurrentUser();
  }
 void getCurrentUser()async{
   try{
     final user = await _auth.currentUser;
     if (user !=null){
       loggedInUser= user;
       print(loggedInUser.email);
     } }
   catch(e){
     print(e);
   }

 }

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
            child: GestureDetector(
              child: Text('select country UI',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=> CountryDropdown() ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 5),
            child: GestureDetector(
              child: Text('Select location',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=> experimentPage() ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30,left: 5),
            child: GestureDetector(
              child: Text('LOCATION',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),),
              onTap: (){
                // showModalBottomSheet(context: context, builder: buildBottomSheet);
                getLocation();
                 getData();

                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=> WeatherPage() ));
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

 void getLocation() async{


   Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    latitude = position.latitude;
    longitude = position.longitude;
   print(longitude);
   print(latitude);

 }
 void getData()async{
  Response response = await get('http://api.openweathermap.org/data/2.5/weather?lat=17&lon=81&appid=04a2cee74cd99618dd3dfb2f06de8175');
String data = response.body;
  // print(data);
  // var all =jsonDecode(data);
  // print(response.body);
  var temperature = jsonDecode(data)['main']['temp'];
  var condition = jsonDecode(data)['weather'][0]['description'];
  var city = jsonDecode(data)['name'];



}
 // Future<Widget> buildBottomSheet(BuildContext context)async{
 //   Response response = await get('http://api.openweathermap.org/data/2.5/weather?lat=17&lon=81&appid=04a2cee74cd99618dd3dfb2f06de8175');
 //   String data = response.body;
 //   var condition = jsonDecode(data)['weather'][0]['description'];
 //   return Container(
 //     child: Text(''),
 //   );}
}






