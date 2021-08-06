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
         "api-token": "gGGbRtAH7OxRdWkGG12FcrqVO4nm6PKNjQPJbzWd10pKPCYxL-QIiJr0ajROjO27Q4k",
         "user-email": "vikram@gmail.com"
       } );


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
   Response resp = await get ("https://www.universal-tutorial.com/api/states/India",
     headers: ({
       "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ2aWtyYW1AZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiZ0dHYlJ0QUg3T3hSZFdrR0cxMkZjcnFWTzRubTZQS05qUVBKYnpXZDEwcEtQQ1l4TC1RSWlKcjBhalJPak8yN1E0ayJ9LCJleHAiOjE2MjgzMzkwNTd9.X-FeJBwKHRYb8h5Hyup_V8OPAJTlngDe3Tbkk8cWzsU",
       "Accept": "application/json"
     }),
   );
   Response respo = await get ("https://www.universal-tutorial.com/api/cities/Alaska",
     headers: ({
       "Authorization": "aditya eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJ2aWtyYW1AZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiZ0dHYlJ0QUg3T3hSZFdrR0cxMkZjcnFWTzRubTZQS05qUVBKYnpXZDEwcEtQQ1l4TC1RSWlKcjBhalJPak8yN1E0ayJ9LCJleHAiOjE2MjgzMzkwNTd9.X-FeJBwKHRYb8h5Hyup_V8OPAJTlngDe3Tbkk8cWzsU",
       "Accept": "application/json"
     }),
   );



   List CountryList;

    countries = res.body ;
   // var data = response.body;
   var states = resp.body;
   var city = respo.body;
   // temper = jsonDecode(countries)['country_name'];
   // var dataa = json.decode(res.body);
   // setState(() {
   //   CountryList = dataa['country_name'];
   // });
     cityname=jsonDecode(city);
print(responsenew.body);
   // print(data);
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