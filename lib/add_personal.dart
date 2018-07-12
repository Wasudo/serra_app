import 'package:flutter/material.dart';
import 'package:serra_app/model/item.dart';
import 'package:serra_app/model/timer.dart';
import 'package:serra_app/model/userdata.dart';
import 'package:serra_app/cameraapp.dart';

class AddPersonal extends StatefulWidget {
  AddPersonal({Key key, this.data}) : super(key: key);

  final UserData data;

  @override
  AddPersonalForm createState() {
    return AddPersonalForm(data: data);
  }
}

class AddPersonalForm extends State<AddPersonal> {
  AddPersonalForm({this.data});
  final UserData data;

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final yearController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    descController.dispose();
    yearController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Personal Item"),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Form(
        key: _formKey,
        child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center( child:
              Text("Fill in the details of your Item",
                  style: TextStyle(fontSize: 20.0))),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                decoration: InputDecoration(labelText: 'Name of the Item'),
                controller: nameController,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                decoration: InputDecoration(labelText: 'Description'),
                controller: descController,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Year';
                  }
                  if (!value.contains(new RegExp(r'[0-9]'))) {
                    return 'Please enter a valid Year';
                  }
                },
                decoration:
                    InputDecoration(labelText: 'Year the item is Purchased'),
                controller: yearController,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some Amount';
                  }
                  if (!value.contains(new RegExp(r'[0-9]'))) {
                    return 'Please enter a valid Amount';
                  }
                },
                decoration: InputDecoration(labelText: 'Price of the item'),
                controller: priceController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(0.0),
                    shadowColor: Colors.amber.shade100,
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 500.0,
                      height: 42.0,
                      color: Colors.amber,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Item newItem = new Item(
                            name: nameController.text,
                            description: descController.text,
                            photoid: "",
                            type: "content",
                            premium: Currency(val: 0.00),
                            protected: false,
                            timer: new Dependencies(),
                          );
//                          data.items.add(newItem);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UploadPhotoPage(data: data, newItem: newItem)),
                          );
                        }
                      },
                      child: Text('Next'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
