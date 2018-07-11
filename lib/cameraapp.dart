import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoState createState() => new _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhotoPage> {
  File _image;

  Future getImage() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'test',
      options: new FirebaseOptions(
        googleAppID: '1:836923102394:android:f5ba41b55ad5bcc3',
        gcmSenderID: '836923102394',
        apiKey: 'AIzaSyDCW046vq24RjHsfbQIjoTz5gRzqR2HeBc',
        projectID: 'serradb',
      ),
    );
    final FirebaseStorage storage = new FirebaseStorage(
        app: app, storageBucket: 'gs://serradb.appspot.com');

    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    final StorageReference ref =
        storage.ref().child('item4.jpg');
    final StorageUploadTask uploadTask = ref.putFile(image);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker Example'),
      ),
      body: new Center(
        child: _image == null
            ? new Text('No image selected.')
            : new Image.file(_image),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
