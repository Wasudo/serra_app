import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 240.0,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.amberAccent,
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text("Total balance", style: new TextStyle(fontSize: 20.0)),
                Text("\₱10,000.00", style: new TextStyle(fontSize: 40.0)),
                Divider(
                  color: Colors.brown,
                ),
                Text("Total Reward Points",
                    style: new TextStyle(fontSize: 15.0)),
                new Chip(
                  label:
                      new Text("500 pts", style: new TextStyle(fontSize: 20.0)),
                  backgroundColor: Colors.white,
                ),
              ]),
            ),
          ),
        ),
      ),
      new Expanded(
        child: new Center(
          child: new Text("Button"),
        ),
      ),
    ]);
  }
}
