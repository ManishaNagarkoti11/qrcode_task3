import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  String dummyData;
  TextEditingController qrTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generating QR-CODE"),
        centerTitle: true,
      ),
    body: ListView(
      children: [
        // setting design to textfield
    Padding(
    padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(Icons.edit),
          trailing: FlatButton(
            child: Text(
              "ENTER",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.green,
            onPressed: () {
              // submitting data enter by user to to the QR code data
              setState(() {
                dummyData = qrTextController.text ==""
                    ? null
                    : qrTextController.text;
              });
            },
          ),
        // creating a text field
        title:TextField(
          controller: qrTextController,
            decoration: InputDecoration(
              hintText: "Please enter some data",
            ),
        ),
      ),
    ),
    ),
        (dummyData == null)
            ? Center(child: Text("enter some text to display qr code..."))
            : QrImage(
          // embeddedImage: NetworkImage(
          //   "https://avatars1.githubusercontent.com/u/41328571?s=280&v=4",
          // ),
          data: dummyData,
          //gapless: true,
        ),
      ],
    ),
    );
  }
}


