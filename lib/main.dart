import 'package:flutter/material.dart';
import 'package:serra_app/add_item.dart';
import 'package:serra_app/model/item.dart';
import 'package:serra_app/wallet.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Serra',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new MyHomePage(title: 'Serra'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Item> items;
  TabController _controller;
  int _index;
  double walletBalance = 0.0;

  void _addItem() {
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItem()),
    );
  }

  @override
  void initState() {
    super.initState();
    walletBalance = 10000.00;
    items = <Item>[
      Item(
        name: "My phone",
        description: "Galaxy S9",
        photoid: "item1.jpg",
        type: "content",
        premium: 2000.00,
        protected: false,
      ),
      Item(
        name: "Innova",
        description: "Toyota Innova",
        photoid: "item2.jpg",
        type: "vehicle",
        premium: 6000.00,
        protected: false,
      ),
      Item(
        name: "My Camera",
        description: "Nikkon DLSR",
        photoid: "item3.jpg",
        type: "content",
        premium: 2000.00,
        protected: false,
      ),
    ];

    _controller = new TabController(length: 3, vsync: this);
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return
        //new DefaultTabController(
        //length: 3,
        //child:
        new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new FlatButton(
            child: new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: new Text("\₱"),
              ),
              label: new Text(walletBalance.toStringAsFixed(2)),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              _controller.animateTo(1);
            },
          ),
        ],
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new Scaffold(
            body: itemsList(this.items),
            floatingActionButton: new FloatingActionButton(
              onPressed: _addItem,
              tooltip: 'Add Insured Item',
              child: new Icon(Icons.add),
            ),
          ),
          new Wallet(),
          new Center(child: const Text("Report Claim")),
        ],
      ),
      bottomNavigationBar: Card(
        color: Colors.amber,
        child: new TabBar(
          controller: _controller,
          tabs: [
            new Tab(icon: new Icon(Icons.work), text: "Items"),
            new Tab(
                icon: new Icon(Icons.account_balance_wallet), text: "Wallet"),
            new Tab(icon: new Icon(Icons.healing), text: "Report Claim")
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
        ),
      ),
      // ),
    );
  }

  Widget itemsList(List<Item> items) => ListView(
      shrinkWrap: true,
      children: items
          .map((item) => new Card(
//          color: item.protected? Colors.amber: Colors.white,
                  child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      height: 100.0,
                      color: item.protected ? Colors.amber : Colors.white,
                      child: new Icon(
                        item.protected ? Icons.beenhere : null,
                        color: Colors.white,
                      ),
                    ),
                    flex: item.protected ? 0 : 2,
                  ),
                  new Expanded(
                    child: new Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/serradb.appspot.com/o/" +
                          item.photoid +
                          "?alt=media",
                      fit: BoxFit.fitHeight,
                      height: 100.0,
                    ),
                    flex: 20,
                  ),
                  new Expanded(
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Column(
                        children: <Widget>[
                          new Text(
                            item.name,
                            style: new TextStyle(fontSize: 18.0),
                          ),
                          new Text(item.description),
                          new Text(""),
                          new Text(
                            "\₱" + item.premium.toStringAsFixed(2),
                            style: new TextStyle(fontSize: 18.0),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    flex: 40,
                  ),
                  new Expanded(
                    child: !item.protected
                        ? new ButtonBar(
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.date_range,
                                    size: 30.0,
                                  ),
                                  onPressed: () {}),
                              new IconButton(
                                  icon: Icon(Icons.beenhere, size: 30.0),
                                  onPressed: () {
                                    item.protected = !item.protected;
                                    setState(() {});
                                  }),
                            ],
                          )
                        : new IconButton(
                            icon: Icon(Icons.cancel, size: 30.0),
                            onPressed: () {
                              item.protected = !item.protected;
                              setState(() {});
                            }),
                    flex: !item.protected ? 47 : 20,
                  ),
                ],
              )))
          .toList());
}
