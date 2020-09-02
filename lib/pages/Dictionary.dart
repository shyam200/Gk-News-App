import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import 'dart:io';
class Dictionary extends StatefulWidget {
  //constructor to receive the keyword
final String word;
Dictionary({
  Key key,
  @required
  this.word}):super(key:key);

  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Data Dict"),
      ),
       body: InAppWebView(
         initialUrl:"https://www.lexico.com/en/definition/${widget.word}" ,
  initialOptions: InAppWebViewGroupOptions(

                            crossPlatform:InAppWebViewOptions(
                          mediaPlaybackRequiresUserGesture: false,
                          debuggingEnabled: true,

                        ),
                ), 

       )
       
    );
  }
}