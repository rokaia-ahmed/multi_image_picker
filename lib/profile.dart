
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/theme.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   File? _image ;
  final imagePicker = ImagePicker();

   Future pickImage() async
   {
     dynamic image = await imagePicker.getImage(source:ImageSource.camera);
     setState(() {
       _image= File(image.path) ;
     });
   }
   Future pickImage1() async
   {
     dynamic image = await imagePicker.getImage(source:ImageSource.gallery);
     setState(() {
       _image= File(image.path) ;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile'
        ),
        actions: [
          IconButton(icon: Icon(Icons.brightness_4),
            onPressed: (){
              currentThem.toggleTheme() ;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                  backgroundImage:( _image == null )? null : FileImage(_image!) ,
                   // foregroundImage: NetworkImage('https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg'),
                    radius: 90,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: GestureDetector(
                      onTap: (){
                        bottomSheet();
                      },
                      child: Icon(
                        Icons.camera_alt
                      ),
                    ),
                  ),
                ],
              ),
            ),
                ListTile(
                  leading:Icon(Icons.person),
                  title:Text('Name',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle:Text('Rokaia Ahmed'),
                  trailing: Icon(Icons.edit),
                  ),
                ListTile(
                 leading:Icon(Icons.arrow_circle_up),
                 title:Text('About',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
                subtitle:Text('Don\'t wait opportunity create it ' ),
                 trailing: Icon(Icons.edit),
            ),
                ListTile(
                   leading:Icon(Icons.phone),
                   title:Text('Name',
                   style: TextStyle(
                    color: Colors.grey,
                ),
              ),
                   subtitle:Text('+201115262581'),
                    trailing: Icon(Icons.edit),
            ),


          ],
        ),
      ),
    );
  }
  void bottomSheet(){
    showModalBottomSheet(context: context ,
        builder:(context){
          return Container(
            height: 180.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Profile photo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            child: Icon(
                              Icons.delete,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Remove photo'),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              pickImage1();
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                              child: Icon(
                                  Icons.photo,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Gallery'),
                        ],
                      ),
                      SizedBox(
                        width: 28.0,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              pickImage();
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                              child: Icon(
                                Icons.camera_alt
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Camera'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

}
