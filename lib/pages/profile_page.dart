import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PickedFile _imageFile;

  final ImagePicker _picker = ImagePicker();

  Widget buildBottomSheet(BuildContext context){
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('select the image',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),),
          ),
                SizedBox(
                  height: 20,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    GestureDetector(
                        onTap: ()async{
                          takePhoto(ImageSource.gallery);
                        },
                        child: Icon(Icons.image,size: 40,)),
                    SizedBox(width: 20),
                    GestureDetector(
                        onTap: (){
                          takePhoto(ImageSource.camera);
                        },
                        child: Icon(Icons.camera_alt,size: 40,)),
                  ],
                )

        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source,);
    setState(
        (){
          _imageFile = pickedFile;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.only(top: 140,left: 140),
                  child: CircleAvatar(

                    backgroundColor: Colors.teal,
                    child: GestureDetector(
                      child: IconButton(icon: Icon(Icons.edit,color: Colors.teal.shade200,),

                        onPressed: (){
                        showModalBottomSheet(context: context, builder: buildBottomSheet);


                        },


                      ),
                    ),
                  ),
                ),
                radius: 90,
                backgroundImage: _imageFile==null? NetworkImage('https://static.wikia.nocookie.net/disney/images/4/4a/Thor_Odinson_TDW_poster_textless.jpg/revision/latest/top-crop/width/360/height/450?cb=20130615173905'):FileImage(File(_imageFile.path)),

              ),
            )
          ],
        ),
      ),
    );


  }
}
