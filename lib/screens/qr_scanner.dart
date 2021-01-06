import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeScan;
  String qrCodeResult;
  int camera=-1;
  bool backCamera = true;
  //creating a scan function
  Future<void> _scan() async {
    ScanResult codeScanner = await BarcodeScanner.scan(
     //setting camera option
      options: ScanOptions(
        useCamera: camera,
      ),
    );
    setState(() {
    qrCodeResult = codeScanner.rawContent;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((backCamera?"Back Camera":"FrontCamera"),
          style: TextStyle(
          fontSize: 16.0,
        ),),
      actions: [
        IconButton(icon: backCamera
            ?Image.asset("images/backcamera.png")
            :Image.asset("images/frontcamera.png"),
          onPressed: (){
          setState(() {
            backCamera=!backCamera;
            camera=backCamera?-1:1;
          });
          },
        ),


      ],
      ),

      //displaying the result
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child: Center(
                 child: Text(
                     (qrCodeResult==null)||(qrCodeResult=="")
                         ? "Please scan to show some result"
                         :"Result:" + qrCodeResult,
                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                 ),
            ),
          ),
        SizedBox(
          height: 80.0,
        ),
          IconButton(icon:Image.asset("images/scanicon.png",),
              iconSize: 50.0,
              onPressed:(){
                _scan();
              }
          ),
          Text("Click to scan",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),

        ],
      ),
    );
  }
}