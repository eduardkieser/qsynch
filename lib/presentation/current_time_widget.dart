import 'package:flutter/material.dart';
import 'dart:async';

import 'package:qsynch/presentation/qr_widget.dart';

class CurrentTimeWidget extends StatefulWidget {
  @override
  _CurrentTimeWidgetState createState() => _CurrentTimeWidgetState();
}

class _CurrentTimeWidgetState extends State<CurrentTimeWidget> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildQrAndText();
  }
}
