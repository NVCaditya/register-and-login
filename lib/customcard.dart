import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final ImageProvider picture;
  final String title;
  final String name;
  final String time;
  final String message;
  CustomCard({this.picture,this.title,this.name,this.time,this.message});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: picture,
        radius: 30,
        backgroundColor: Colors.black87,
      ),
      trailing: Text(time),
      title: Text(title,style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),),
      subtitle: Row(
        children: [
          Text(name),
          SizedBox(width: 3,),
          Text('-'),
          Text(message),
        ],
      )
    );
  }
}
