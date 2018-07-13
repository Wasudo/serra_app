import 'dart:async';
import 'package:flutter/material.dart';
import 'package:countdown/countdown.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  static String appTitle = "Count down";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new StreamBuilder(
          stream: new CounterScreenStream(20),
          builder: (context, snapshot) => buildHome(
              context,
              snapshot.hasData
              // If our stream has delivered data, build our Widget properly
                  ? snapshot.data
              // If not, we pass through a dummy model to kick things off
                  : new Duration(seconds: 5),
              appTitle)),
    );
  }

  // The latest value of the CounterScreenModel from the CounterScreenStream is
  // passed into the this version of the build function!
  Widget buildHome(BuildContext context, Duration duration, String title) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text(
          'Count down ${ duration.inSeconds }',
        ),
      ),
    );
  }
}

class CounterScreenStream extends Stream<Duration> {
  final Stream<Duration> _stream;

  CounterScreenStream(int initialValue)
      : this._stream = createStream(initialValue);

  @override
  StreamSubscription<Duration> listen(
      void onData(Duration event),
      {Function onError,
        void onDone(),
        bool cancelOnError}) =>
      _stream.listen(onData,
          onError: onError, onDone: onDone, cancelOnError: cancelOnError);

  // The method we use to create the stream that will continually deliver data
  // to the `buildHome` method.
  static Stream<Duration> createStream(int initialValue) {
    var cd = new CountDown(new Duration(seconds: initialValue));
    return cd.stream;
  }
}