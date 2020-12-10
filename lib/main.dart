import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:downloadvideo/video_status_model.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:flutter_downloader/flutter_downloader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
     // theme: kThemeData,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  String link ="https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

 // MyApp(this.link);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //final imgUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  bool downloading = true;
  var progressString = "";
  bool list = false;
  //VideoStatusModel photo = VideoStatusModel();

  @override
  void initState() {
    super.initState();
   //downloadFile();
   // getData();
    //downloadFile();
  }

  Future<void> downloadFile() async {

    Dio dio = Dio();
    try {
      String dirloc = '';
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";

      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(
          widget.link, "$dirloc/${widget.link
          .split("/")
          .last}");
      print(widget.link);
      print(dir.path);
    } catch (e) {
      print(e);
    }
    Fluttertoast.showToast(
        msg: "Download Completed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    /*try {
      var dir = await getApplicationDocumentsDirectory();
      print("path ${dir.path}");
      await dio.download(imgUrl, "${dir.path}/demo.mp4",
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              downloading = true;
              progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
            });
          });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        /*child: downloading
            ? Container(
          height: 120.0,
          width: 200.0,
          child: Card(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Downloading File: $progressString",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
            : Text("No Data"),
      ),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("Download"),
              onPressed: (){
                downloadFile();
              },
            )
          ],

    ),

      ),
    );
  }

  /*Future<VideoStatusModel> getData() async {
    String url =
        'https://divineinfotech.website/Api/VideoStatus/videostatus.php';
    //  var map = new Map<String, dynamic>();
    //  map['category'] = 'Ganesh';
    final response = await http.post(url,
        headers: {'key': '52lofhgtefgfdsebvbba1ghkiy45f84lofrre'},
        body: {'category': 'Ganesh'});

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final decoder = JsonDecoder();
      final Map jsonResponse = decoder.convert(response.body);
      photo = VideoStatusModel.fromJson(jsonResponse);
      setState(() {
        list = true;
      });
      return VideoStatusModel.fromJson(jsonData);
    } else {
      throw Exception();
    }
  }*/
}