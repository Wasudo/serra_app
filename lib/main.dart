import 'package:flutter/material.dart';
import 'package:serra_app/model/item.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items =
  <Item>[
    Item(
        name: "My phone awdawdawdawdawdawd",
        description: "Galaxy S9",
        photoid: "item1.jpg",
        type: "content",
        premium: 10000.00,
        protected: false,
    ),
    Item(
        name: "Innova",
        description: "Toyota Innova",
        photoid: "item2.jpg",
        type: "vehicle",
        premium: 12000.00,
        protected: false,
    ),
    Item(
      name: "My Camera",
      description: "Nikkon DLSR",
      photoid: "item3.jpg",
      type: "content",
      premium: 10000.00,
      protected: false,
    ),
  ];

  void _refresh() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: itemsList(this.items),
      floatingActionButton: new FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget itemsList(List<Item> items) => ListView(
    shrinkWrap: true,
    children: items
      .map((item) => new Card(
//          color: item.protected? Colors.amber: Colors.white,
          child:
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    height: 100.0,
                    color: item.protected? Colors.amber: Colors.white,
                    child: new Icon( item.protected? Icons.beenhere: null, color: Colors.white,),
                  ),
                  flex: item.protected? 0 : 2,
                ),
                new Expanded(
                    child: new Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/serradb.appspot.com/o/"+item.photoid+"?alt=media",
                      fit: BoxFit.fitHeight,
                      height: 100.0,
                    ),
                    flex: 20,
                ),
                new Expanded(
                  child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child:
                        new Column(
                          children: <Widget>[
                            new Text(item.name, style: new TextStyle(fontSize: 18.0),),
                            new Text(item.description),
                            new Text(""),
                            new Text("\$" + item.premium.toString(), style: new TextStyle(fontSize: 18.0),),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,

                        ),
                      ),
                  flex: 40,
                ),
                new Expanded(
                    child:
                    !item.protected ?
                    new ButtonBar(
                      children: <Widget>[
                        new IconButton(
                            icon: Icon(Icons.date_range,size: 30.0,),
                            onPressed: (){}),
                        new IconButton(
                            icon: Icon(Icons.beenhere,size: 30.0),
                            onPressed: (){item.protected = !item.protected;
                            setState(() {
                            });}),
                      ],
                    )
                        :
                    new IconButton(
                       icon: Icon(Icons.cancel,size: 30.0),
                       onPressed: (){item.protected = !item.protected;
                          setState(() {
                        });}
                        ),
                  flex: !item.protected ? 47 : 20,
                ),
              ],
            )

//            new ListTile(
//                leading: new Image.network(
//                  "https://firebasestorage.googleapis.com/v0/b/serradb.appspot.com/o/"+item.photoid+"?alt=media",
//                  height: 100.0,
//                  width: 100.0,
//                  fit: BoxFit.fitHeight,
//                ),
//                selected: item.protected,
//                title: Text(item.name),
//                subtitle: Text("\$" + item.premium.toString()),
//                onTap: () { /* react to the tile being tapped */ },
//                trailing: new ButtonBar(
//                  children: <Widget>[
//                    new IconButton(
//                        icon: Icon(Icons.beenhere),
//                        onPressed: (){item.protected = !item.protected;
//                        setState(() {
//
//                        });}),
//                    new IconButton(
//                        icon: Icon(Icons.date_range),
//                        onPressed: (){}),
//                  ],
//                ),
//            )
        )
      ).toList()
  );

}
