import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'city_weather.dart';

void main() => runApp(MaterialApp());

class CountryDropdown extends StatelessWidget {

  var countries;
  var states;
  var city;
  var temper;
  var countryname;
  var statename;
  var cityname;

  List stateList;
  List cityList;
  List countryList;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var countries;
  var states;
  var city;
  var temper;
  var countryname;
  var statename;
  var cityname;

  List stateList;
  List cityList;
  List countryList;

  @override
  void initState() {
    getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Select your Country, State and City'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          //======================================================== State
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: countryname,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select Country'),
                        onChanged: (String newValue) {
                          setState(() {
                            countryname = newValue;
                            getCountry();
                            print(countryname);
                          });
                        },
                        items: countryList?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['country_name']),
                            value: item['country_name'].toString(),
                          );
                        })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: statename,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select State'),
                        onChanged: (String newValue) {
                          setState(() {
                            statename = newValue;
                            getCountry();
                            print(statename);
                          });
                        },
                        items: stateList?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['state_name']),
                            value: item['state_name'].toString(),
                          );
                        })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // //======================================================== City
          //
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: cityname,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select City'),
                        onChanged: (String newValue) {
                          setState(() {
                            cityname = newValue;
                            print(cityname);
                          });
                        },



                        items: cityList?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['city_name']),
                            value: item['city_name'].toString(),
                          );
                        })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(onPressed: (
              ){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=> CityWeatherPage(cityname:cityname) ));
            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext=>CityWeatherPage())))
          }, child: Text("Submit"), color: Colors.green,)
        ],
      ),
    );
  }



  void getCountry()async{
    // Response response = await  get ("https://www.universal-tutorial.com/api/getaccesstoken",
    //     headers: {
    //       "Accept": "application/json",
    //       "api-token": "lxSg-eDCcg8Loj2xynYvnjzSt9wjIGu4gTHRqk-ZyyvVvR_aERmGO_Syo6Lh-s0QnFo",
    //       "user-email": "aaditya@gmail.com"
    //     } );
    Response res = await get ("https://www.universal-tutorial.com/api/countries/",
      headers: ({
        "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ2aWtyYW1AZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiZ0dHYlJ0QUg3T3hSZFdrR0cxMkZjcnFWTzRubTZQS05qUVBKYnpXZDEwcEtQQ1l4TC1RSWlKcjBhalJPak8yN1E0ayJ9LCJleHAiOjE2MjgzMzkwNTd9.X-FeJBwKHRYb8h5Hyup_V8OPAJTlngDe3Tbkk8cWzsU",
        "Accept": "application/json"
      }),
    );
    Response resp = await get ("https://www.universal-tutorial.com/api/states/$countryname",
      headers: ({
        "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ2aWtyYW1AZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiZ0dHYlJ0QUg3T3hSZFdrR0cxMkZjcnFWTzRubTZQS05qUVBKYnpXZDEwcEtQQ1l4TC1RSWlKcjBhalJPak8yN1E0ayJ9LCJleHAiOjE2MjgzMzkwNTd9.X-FeJBwKHRYb8h5Hyup_V8OPAJTlngDe3Tbkk8cWzsU",
        "Accept": "application/json"
      }),
    );
    Response respo = await get ("https://www.universal-tutorial.com/api/cities/$statename",
      headers: ({
        "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ2aWtyYW1AZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiZ0dHYlJ0QUg3T3hSZFdrR0cxMkZjcnFWTzRubTZQS05qUVBKYnpXZDEwcEtQQ1l4TC1RSWlKcjBhalJPak8yN1E0ayJ9LCJleHAiOjE2MjgzMzkwNTd9.X-FeJBwKHRYb8h5Hyup_V8OPAJTlngDe3Tbkk8cWzsU",
        "Accept": "application/json"
      }),
    );



// print(res.body);

    countryList = jsonDecode(res.body) ;
    stateList = jsonDecode(resp.body) ;
    cityList = jsonDecode(respo.body) ;

    // var data = response.body;
    // var states = resp.body;
    // var city = respo.body;
    setState(() {
      countryList;
      stateList;
      cityList;

    });
    // temper = jsonDecode(countries)['country_name'];
    // var dataa = json.decode(res.body);
    // setState(() {
    //   CountryList = dataa['country_name'];
    // });
    // cityname=jsonDecode(city);

    // print(data);
    // print(countries);
    // print(states);
    // print(city);
    // print("state start");
    // statename=(states);
    // print(statename);
    // print("state end");
    // print("city start");
    // cityname=jsonDecode(city);
    // print(cityname);
    // print ("city end");
    //
    // print("country start");
    // countryname=jsonDecode(countries);





    // List citiesList;
    // citiesList = cityname;
    // print(citiesList);







  }































  //=============================================================================== Api Calling here
//
// //CALLING STATE API HERE
//   List CountryList;
//   String _myCountry;
//
//   String countryInfoUrl = 'https://api.printful.com/countries';
//   Future<String> _getCountryList() async {
//     await http.post(countryInfoUrl, headers: {
//       'Content-Type': 'application/x-www-form-urlencoded'
//     }, body: {
//       "api_key": '25d55ad283aa400af464c76d713c07ad',
//     }).then((response) {
//       var data = json.decode(response.body);
//
//       print(data);
//       setState(() {
//         CountryList = data['state'];
//       });
//     });
//   }
// // Get State information by API
//   List statesList;
//   String _myState;
//   List country
//
//   String stateInfoUrl = 'https://api.printful.com/countries';
//   Future<String> _getStateList() async {
//     await http.post(stateInfoUrl, headers: {
//       'Content-Type': 'application/x-www-form-urlencoded'
//     }, body: {
//       "api_key": '25d55ad283aa400af464c76d713c07ad',
//     }).then((response) {
//       var data = json.decode(response.body);
//
//      print(data);
//       setState(() {
//         statesList = data['state'];
//       });
//     });
//   }

  // Get State information by API
  // List citiesList;
  // String _myCity;
  //
  // String cityInfoUrl =
  //     'http://cleanions.bestweb.my/api/location/get_city_by_state_id';
  // Future<String> _getCitiesList() async {
  //   await http.post(cityInfoUrl, headers: {
  //     'Content-Type': 'application/x-www-form-urlencoded'
  //   }, body: {
  //     "api_key": '25d55ad283aa400af464c76d713c07ad',
  //     "state_id": _myState,
  //   }).then((response) {
  //     var data = json.decode(response.body);
  //
  //     setState(() {
  //       citiesList = data['cities'];
  //     });
  //   });
  // }
}