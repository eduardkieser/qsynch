import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:qsynch/state/app_state_singelton.dart';
import 'package:qsynch/state/data_state_singleton.dart';

class KeyValueInput extends StatefulWidget {
  @override
  _KeyValueInputState createState() => _KeyValueInputState();
}

class _KeyValueInputState extends State<KeyValueInput> {
  final _keyController = TextEditingController();
  final _valueController = TextEditingController();

  DataStateSingleton dataState = DataStateSingleton();

  @override
  Widget build(BuildContext context) {
    double _height = 220 + 60 * dataState.additional_data.length.toDouble();
    // print("Building menue!! with value ${AppStateSingleton().menu_open}");
    if (AppStateSingleton().menu_open == true) {
      return Container(
        height: _height,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                const Text("Epoch only"),
                Switch(
                    value: DataStateSingleton().epoch_only,
                    onChanged: ((value) {
                      DataStateSingleton().epoch_only = value;
                    }))
              ],
            ),
            TextField(
              controller: _keyController,
              decoration: InputDecoration(
                labelText: "Key",
              ),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                labelText: "Value",
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataState.addData(
                        _keyController.text, _valueController.text);
                  });
                },
                child: Text("Add"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    AppStateSingleton().menu_open = false;
                  });
                },
                child: Text("DONE"),
              ),
            ]),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dataState.additional_data.length,
                itemBuilder: (context, index) {
                  var key = dataState.additional_data.keys.elementAt(index);
                  var value = dataState.additional_data[key];
                  return ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        DataStateSingleton().removeData(key);
                      },
                    ),
                    title: Text("$key : ${value!}"),
                    // subtitle: Text("${value!}"),
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
