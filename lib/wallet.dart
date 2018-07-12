import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  Wallet({this.walletBalance});
  final double walletBalance;

  @override
  WalletState createState() => new WalletState(walletBalance: walletBalance);
}

class WalletState extends State<Wallet> {
  WalletState({this.walletBalance});
  final double walletBalance;

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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.amberAccent,
                  Colors.amber.shade600,
                ], tileMode: TileMode.mirror),
              ),
              child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Text("Total balance", style: new TextStyle(fontSize: 20.0)),
                  Text("\₱$walletBalance",
                      style: new TextStyle(fontSize: 35.0)),
                  Divider(
                    color: Colors.brown,
                  ),
                  Text("Total Reward Points",
                      style: new TextStyle(fontSize: 15.0)),
                  new Chip(
                    label: new Text("500 pts",
                        style: new TextStyle(fontSize: 20.0)),
                    backgroundColor: Colors.white,
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
      new Expanded(
        child: new GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          crossAxisCount: 3,
          children: <Widget>[
            new Material(
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Colors.amber.shade100,
              elevation: 2.0,
              child: MaterialButton(
                minWidth: 500.0,
                height: 85.0,
                color: Colors.amber,
                onPressed: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.add, size: 24.0,), Text('Add Funds', textAlign: TextAlign.center,)]),
              ),
            ),
            new Material(
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Colors.amber.shade100,
              elevation: 2.0,
              child: MaterialButton(
                minWidth: 500.0,
                height: 85.0,
                color: Colors.amber,
                onPressed: () {},
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.card_giftcard, size: 24.0,), Text('Rewards', textAlign: TextAlign.center,)]),
              ),

            ),
            new Material(
              borderRadius: BorderRadius.circular(0.0),
              shadowColor: Colors.amber.shade100,
              elevation: 2.0,
              child: MaterialButton(
                minWidth: 500.0,
                height: 85.0,
                color: Colors.amber,
                onPressed: () {},
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.history, size: 24.0,), Text('History', textAlign: TextAlign.center,)]),
              ),

            ),
          ],
        ),
      ),
    ]);
  }
}
