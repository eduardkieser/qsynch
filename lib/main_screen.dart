/*
 * QR.Flutter
 * Copyright (c) 2019 the QR.Flutter authors.
 * See LICENSE for distribution and usage details.
 */

import 'dart:async';
import 'dart:ui' as ui;

import 'package:qsynch/presentation/current_time_widget.dart';
import 'package:qsynch/presentation/data_mod_widget.dart';
import 'package:qsynch/presentation/qr_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qsynch/state/app_state_singelton.dart';

/// This is the screen that you'll see when the app starts
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int secondsSinceEpoch =
        DateTime.now().microsecondsSinceEpoch ~/ Duration.millisecondsPerSecond;

    return Material(
      color: Colors.white,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppStateSingleton().menu_open = !AppStateSingleton().menu_open;
          },
          child: Icon(Icons.qr_code),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 400,
                    child: Stack(
                      children: [
                        CurrentTimeWidget(),
                        KeyValueInput(),
                      ],
                    ),
                  ),
                ),
              ),
              // const Padding(
              //     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
