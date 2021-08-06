import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

class WeatherPage extends StatefulWidget  {


  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var temperature;
  var condition = 'hail';
  var city;

@override
  void initState() {

    super.initState();
    getData();

  }


  void getData()async{
    Response response = await get('http://api.openweathermap.org/data/2.5/weather?lat=17&lon=81&appid=04a2cee74cd99618dd3dfb2f06de8175');
    String data = response.body;


    // print(data);
    // var all =jsonDecode(data);
    // print(response.body);
setState(() {


      temperature = jsonDecode(data)['main']['temp'];
      condition = jsonDecode(data)['weather'][0]['description'];
      city = jsonDecode(data)['name'];


});

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.thermostat,color: Colors.grey,),
                  Text('The temperature is',style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.teal
                  ),)
                ],
              ),

              Container(

                child: Center(child: Text('$temperature',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800
                  ),
                ),
                ),
              ),
            ],
          ),

          Column(

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud,color: Colors.grey,),
                  Text('The weather condition is',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.teal
                  ),)
                ],
              ),

              Container(
                child: Center(child: Text('$condition',textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.w800
                  ),
                ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,color: Colors.grey,),
                  Text('You are in',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    color: Colors.teal
                  ),)
                ],
              ),

              Container(
                child: Center(child: Text('$city',textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,

                  ),
                ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


