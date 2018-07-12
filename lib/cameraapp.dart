import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:serra_app/model/item.dart';
import 'package:serra_app/model/timer.dart';
import 'package:serra_app/model/userdata.dart';
import 'package:serra_app/home.dart';

class UploadPhotoPage extends StatefulWidget {
  UploadPhotoPage({Key key, this.data, this.newItem}) : super(key: key);
  final UserData data;
  final Item newItem;

  @override
  UploadPhotoState createState() =>
      new UploadPhotoState(data: data, newItem: newItem);
}

class UploadPhotoState extends State<UploadPhotoPage> {
  UploadPhotoState({this.data, this.newItem});
  final UserData data;
  final Item newItem;

  File _image;
  bool attachSuccessful = false;
  String photoName;
  String buttonName = "Submit";

  Future getImage() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 1280.0, maxWidth: 1280.0);
    setState(() {
      _image = image;
      attachSuccessful = true;
      photoName = 'item' + (data.items.length + 1).toString() + '.jpg';
      print(photoName);
    });
  }

  Future upload() async {
    //loading();
    setState(() {
      buttonName = "Adding...";
    });
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'uploadphoto',
      options: new FirebaseOptions(
        googleAppID: '1:836923102394:android:f5ba41b55ad5bcc3',
        gcmSenderID: '836923102394',
        apiKey: 'AIzaSyDCW046vq24RjHsfbQIjoTz5gRzqR2HeBc',
        projectID: 'serradb',
      ),
    );
    final FirebaseStorage storage = new FirebaseStorage(
        app: app, storageBucket: 'gs://serradb.appspot.com');

    final StorageReference ref = storage.ref().child(photoName);
    final StorageUploadTask uploadTask = ref.putFile(_image);
    await uploadTask.future.whenComplete(() {
      print("successful upload");
      addItem();
    });
  }

  void addItem() {
    newItem.photoid = photoName;
    data.items.add(newItem);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp(items: data.items)),
    );
  }

  void loading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new Dialog(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Text("Sending data..."),
              ],
            ),
          );
        });
//    new Future.delayed(new Duration(seconds: 3), () {
//      Navigator.pop(context); //pop dialog
//    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Attach Photo of Item'),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Center(
        child: ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: _image == null
                      ? new Center(child: Text('No image selected.', style: TextStyle(fontSize: 18.0),))
                      : new Image.file(
                          _image,
                          fit: BoxFit.contain,
                        ),
                  height: 370.0,
                  width: 400.0,
                ),
                Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(0.0),
                    shadowColor: Colors.amber.shade100,
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 500.0,
                      height: 42.0,
                      onPressed: getImage,
                      child: Text('Take Photo'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Center(
            child: Material(
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Colors.amber.shade100,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 500.0,
                height: 42.0,
                color: Colors.amber,
                onPressed: () {
                  if (attachSuccessful) {
                    upload();
                  }
                },
                child: Text(buttonName),
              ),
            ),
          ),
        ]),
      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: getImage,
//        tooltip: 'Pick Image',
//        child: new Icon(Icons.add_a_photo),
//      ),
    );
  }
}
