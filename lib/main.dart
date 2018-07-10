import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serra_app/home.dart';
import 'package:serra_app/model/item.dart';
import 'package:serra_app/model/timer.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new SerraApp());
}

class SerraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Serra',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new LoginPage(title: 'Serra'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  List<Item> items = <Item>[
    Item(
      name: "My phone",
      description: "Galaxy S9",
      photoid: "item1.jpg",
      type: "content",
      premium: Currency(val:0.00),
      protected: false,
      timer: new Dependencies(),
    ),
    Item(
      name: "Innova",
      description: "Toyota Innova",
      photoid: "item2.jpg",
      type: "vehicle",
      premium: Currency(val:0.00),
      protected: false,
      timer: new Dependencies(),
    ),
    Item(
      name: "My Camera",
      description: "Nikkon DLSR",
      photoid: "item3.jpg",
      type: "content",
      premium: Currency(val:0.00),
      protected: false,
      timer: new Dependencies(),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset(
          'assets/serra_logo.png',
          fit: BoxFit.contain,
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.amber.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp(items: items)),
            );
          },
          color: Colors.white,
          child: Text('Log In'),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.amberAccent,
          ]),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel
            ],
          ),
        ),
      ),
    );
  }
}
