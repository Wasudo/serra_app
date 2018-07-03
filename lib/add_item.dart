import 'package:flutter/material.dart';
import 'package:serra_app/add_personal.dart';
import 'package:serra_app/cameraapp.dart';

class AddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Insured Item"),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            } ),
      ),
      body: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: const Text("Select item type to Insure:", style: TextStyle(fontSize: 20.0),),
            ),
            new Expanded (child:
            new GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              crossAxisCount: 2,
              children: <Widget>[
                new Card(
                  child: new Column(children: <Widget> [
                    new IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddPersonal()),
                        );
                      },
                      icon: new Icon(Icons.phone_android),
                      splashColor: Colors.amber,
                      iconSize: 80.0,
                    ),
                    new Divider(),
                    const Text("Personal Items"),
                  ],
                  ),
                ),
                new Card(
                  child: new Column(children: <Widget> [
                    new IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      icon: new Icon(Icons.airplanemode_active),
                      splashColor: Colors.amber,
                      iconSize: 80.0,
                    ),
                    new Divider(),
                    const Text("Travel"),
                  ],
                  ),
                ),
                new Card(
                  child: new Column(children: <Widget> [
                    new IconButton(
                      onPressed: (){},
                      icon: new Icon(Icons.directions_car),
                      splashColor: Colors.amber,
                      iconSize: 80.0,
                    ),
                    new Divider(),
                    const Text("Vehicle"),
                  ],
                  ),
                ),
                new Card(
                  child: new Column(children: <Widget> [
                    new IconButton(
                      onPressed: (){},
                      icon: new Icon(Icons.home),
                      splashColor: Colors.amber,
                      iconSize: 80.0,
                    ),
                    new Divider(),
                    const Text("House"),
                  ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}