import 'package:flutter/material.dart';


import 'dart:convert';



import 'package:http/http.dart';

class experimentPage extends StatefulWidget {


  @override
  _experimentPageState createState() => _experimentPageState();
}

class _experimentPageState extends State<experimentPage> {
  var countries;
  var temper;
  var countryname;
  var statename;
  var cityname;


 void getCountry()async{
   Response responsenew = await  get ("https://www.universal-tutorial.com/api/getaccesstoken",
       headers: {
         "Accept": "application/json",
         "api-token": "9o2hoCHrInlupPe9KFPbUxvBuK_Z_52ETnMDcP_yK9v0ehTW-McBPDJHkbPLMlvpkU0",
         "user-email": "aaaaditya@gmail.com"
       } );


   Response response = await  get ("https://www.universal-tutorial.com/api/getaccesstoken",
       headers: {
         "Accept": "application/json",
         "api-token": "lxSg-eDCcg8Loj2xynYvnjzSt9wjIGu4gTHRqk-ZyyvVvR_aERmGO_Syo6Lh-s0QnFo",
         "user-email": "aaditya@gmail.com"
       } );
   Response res = await get ("https://www.universal-tutorial.com/api/countries/",
   headers: ({
     "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhYWFhZGl0eWFAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiOW8yaG9DSHJJbmx1cFBlOUtGUGJVeHZCdUtfWl81MkVUbk1EY1BfeUs5djBlaFRXLU1jQlBESkhrYlBMTWx2cGtVMCJ9LCJleHAiOjE2MjgyNDg4MDh9.Fv8fUilQc_s9Sk0eazYjGk6ODTcpBEqZVH1Ik8J_Egs",
     "Accept": "application/json"
   }),
   );
   Response resp = await get ("https://www.universal-tutorial.com/api/states/India",
     headers: ({
       "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhYWFhZGl0eWFAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiOW8yaG9DSHJJbmx1cFBlOUtGUGJVeHZCdUtfWl81MkVUbk1EY1BfeUs5djBlaFRXLU1jQlBESkhrYlBMTWx2cGtVMCJ9LCJleHAiOjE2MjgyNDg4MDh9.Fv8fUilQc_s9Sk0eazYjGk6ODTcpBEqZVH1Ik8J_Egs",
       "Accept": "application/json"
     }),
   );
   Response respo = await get ("https://www.universal-tutorial.com/api/cities/Alaska",
     headers: ({
       "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhYWFhZGl0eWFAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiOW8yaG9DSHJJbmx1cFBlOUtGUGJVeHZCdUtfWl81MkVUbk1EY1BfeUs5djBlaFRXLU1jQlBESkhrYlBMTWx2cGtVMCJ9LCJleHAiOjE2MjgyNDg4MDh9.Fv8fUilQc_s9Sk0eazYjGk6ODTcpBEqZVH1Ik8J_Egs",
       "Accept": "application/json"
     }),
   );



   List CountryList;

    countries = res.body ;
   var data = response.body;
   var states = resp.body;
   var city = respo.body;
   // temper = jsonDecode(countries)['country_name'];
   // var dataa = json.decode(res.body);
   // setState(() {
   //   CountryList = dataa['country_name'];
   // });
     cityname=jsonDecode(city);
print(responsenew.body);
   print(data);
   print(countries);
   print(states);
   print(city);
   print("state start");
// statename=jsonDecode(states);
// print(statename);
   print("state end");
   print("city start");
   cityname=jsonDecode(city);
   print(cityname);
   print ("city end");

   print("country start");
   countryname=jsonDecode(countries);
   print(countryname);
   print ("country end");


   List citiesList;
   citiesList = cityname;
   print(citiesList);







 }



@override
  void initState() {
    // TODO: implement initState
  getCountry();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   getCountry();
    return Container();
  }
}









// DFjNvoAIahQOjnIi5NpvQUANVi90Zpt6dFakxZjMnGd0jtNOWitHtpBSyCREeYySrJ8