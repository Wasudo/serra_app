import 'package:flutter/material.dart';

class ElapsedTime {
  final int minutes;

  ElapsedTime({
    this.minutes,
  });
}

class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
  final Stopwatch stopwatch = new Stopwatch();
}