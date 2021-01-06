import 'package:flutter/material.dart';
import 'package:qrcodetask3/screens/qr_generator.dart';
import 'package:qrcodetask3/screens/qr_scanner.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    appBar: AppBar(
     title: Text("QR_CODE"),
     centerTitle: true,
   ),
      body: Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network("https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556"),
        SizedBox(height: 25.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
             // color: Colors.blue[200],
              child: Text("Generate QR-CODE", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GeneratePage()));
              },
             // onPressed: (){},
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black,width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            FlatButton(
              // color: Colors.blue[200],
              child: Text("Scan QR-CODE", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) =>
                  ScanPage()));
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black,width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ],
        ),
      ],
    ),
      ),
    );
  }
}
