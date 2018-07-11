import 'package:flutter/material.dart';
import 'package:serra_app/model/item.dart';
import 'package:serra_app/model/timer.dart';
import 'dart:async';

class InsuranceTimer extends StatefulWidget {
  InsuranceTimer({this.dependencies, this.premium, this.totalPremium});
  final Dependencies dependencies;
  final double premium;
  final Currency totalPremium;

  InsuranceTimerState createState() => new InsuranceTimerState(
      dependencies: dependencies, premium: premium, totalPremium: totalPremium);
}

class InsuranceTimerState extends State<InsuranceTimer> {
  InsuranceTimerState({this.dependencies, this.premium, this.totalPremium});
  final Dependencies dependencies;
  final double premium;
  final Currency totalPremium;

  Timer timer;
  int minutes;

  @override
  void initState() {
    timer = new Timer.periodic(new Duration(seconds: 1), callback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (minutes != dependencies.stopwatch.elapsed.inSeconds) {
      minutes = dependencies.stopwatch.elapsed.inSeconds;
      final ElapsedTime elapsedTime = new ElapsedTime(
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new DisplayPremiumValue(
        dependencies: dependencies,
        premium: premium,
        totalPremium: totalPremium);
  }
}

class DisplayPremiumValue extends StatefulWidget {
  DisplayPremiumValue({this.dependencies, this.premium, this.totalPremium});
  final Dependencies dependencies;
  final double premium;
  final Currency totalPremium;

  DisplayPremiumValueState createState() => new DisplayPremiumValueState(
      dependencies: dependencies, premium: premium, totalPremium: totalPremium);
}

class DisplayPremiumValueState extends State<DisplayPremiumValue> {
  DisplayPremiumValueState(
      {this.dependencies, this.premium, this.totalPremium});
  final Dependencies dependencies;
  final double premium;
  final Currency totalPremium;

  int minutes = 0;
  double value = 0.0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    value = totalPremium.val;
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.minutes != minutes && this.mounted) {
      setState(() {
        minutes = elapsed.minutes;
        print (minutes.toString());
        if (minutes > 60) {
          value = premium * minutes;
        } else if (minutes < 60 && minutes > 0) {
          value = premium * 60;
        } else {
          value = 0.0;
        }
        totalPremium.val = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String valueStr = value.toStringAsFixed(2);

    return new Text("\₱$valueStr", style: new TextStyle(fontSize: 18.0));
  }
}
