import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:project1/profile.dart';

class MultiImage extends StatefulWidget {

  @override
  _MultiImageState createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  List<Asset> images = <Asset>[];
  List<Asset> resultList = <Asset>[];
  Future loadAsset()async {
   // List<Asset> resultList = <Asset>[];
    try{
      resultList = await MultiImagePicker.pickImages(
        maxImages:300,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarColor: 'Black',
        ),
      );
      setState(() {
        images = resultList;
      });
    }
    catch(e){
     print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Image'),
        actions: [
          IconButton(icon:
          Icon(Icons.camera_alt),
            onPressed: (){
              loadAsset();
            }
          ),
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(),
              ),
            );
          },
              icon:Icon(Icons.settings),
          ),
        ],
      ),
      body:GridView.count(crossAxisCount: 3,
        children:
          List.generate(images.length, (index) {
          return AssetThumb(
            asset: images[index],
              width: 300,
              height: 300,
          );
          }
          ),

      ) ,

    );
  }
}
