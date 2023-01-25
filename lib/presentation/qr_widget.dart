import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qsynch/presentation/data_mod_widget.dart';
import 'package:qsynch/state/data_state_singleton.dart';

Widget buildQrWidget(String data_str) {
  return Container(
    width: 280,
    child: CustomPaint(
      size: Size.square(280),
      painter: QrPainter(
        data: data_str,
        version: QrVersions.auto,
        // size: 320.0,
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size.square(20),
        ),
      ),
    ),
  );
}

Widget buildTextInfo(text) {
  int secondsSinceEpoch =
      DateTime.now().microsecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
  return Text(text);
}

String formatTime(DateTime time) {
  return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
}

Widget buildQrAndText() {
  int secondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  String data_str = DataStateSingleton().createDataString();
  DateTime now = DateTime.now();
  String localTime = formatTime(now);
  String zuluTime = formatTime(now.toUtc());

  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 40).copyWith(bottom: 40),
    child: ListView(
      children: [
        KeyValueInput(),
        buildQrWidget(data_str),
        Container(
          height: 30,
        ),
        buildTextInfo(data_str),
        Text("\n Local Time: $localTime"),
        Text("UTC Time: $zuluTime"),
      ],
    ),
  );
}
