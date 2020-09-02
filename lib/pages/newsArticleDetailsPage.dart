import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:quickie/ViewModels/newsArticleViewModel.dart';
import 'package:quickie/pages/Dictionary.dart';
import 'dart:async';

class NewsArticleDetailsPage extends StatefulWidget {
 final NewsArticleViewModel article;
  NewsArticleDetailsPage({this.article});

  @override
  _NewsArticleDetailsPageState createState() => _NewsArticleDetailsPageState();
}

class _NewsArticleDetailsPageState extends State<NewsArticleDetailsPage> {
  ContextMenu contextMenu;
  InAppWebViewController _controller;
  String selectedText;
  double progress=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    contextMenu=ContextMenu(
      menuItems:[
        ContextMenuItem(androidId:1, iosId:"1", title:"Dictionary", action: () async{
          print("Menu Dictionary item clicked");
          //Navigating to the dictionary page on item click
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dictionary(word: selectedText)));
         
        })
      ],
      //selecting text on create
      onCreateContextMenu: (hitTestResult){
          //keyword=_webViewController.getSelectedText().toString();
          //To convert the Future string into string we call setState and asynchoriuosly asign the future strign  by promising to await
          setState(() async {
            selectedText=await _controller.getSelectedText();   
          });
      } ,
      // storing the device id in the var
        onContextMenuActionItemClicked: (contextMenuItemClicked){
          var id= (Platform.isAndroid)? contextMenuItemClicked.androidId: contextMenuItemClicked.iosId;
          print("onContextMenuActionItemClicked: " + id.toString() + " " + contextMenuItemClicked.title);
        }
    );
  }

 @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title:Text(widget.article.title),
          ),     
         body:
        // (progress<1.0) ? LinearProgressIndicator(value:progress):
         Container(   
           height: MediaQuery.of(context).size.height*1,        
           child: Column(
             children: [
               Container(
                // padding: EdgeInsets.all(0.0),
                 child: (progress<1.0) ?
                 LinearProgressIndicator(value: progress,backgroundColor: Colors.black12):Container(),
               ),
               Expanded(
                 child: Container(
                   child: InAppWebView(
                     initialUrl: this.widget.article.url ,
                     contextMenu: contextMenu,
                   
                       initialOptions: InAppWebViewGroupOptions(

                                      crossPlatform:InAppWebViewOptions(
                                    mediaPlaybackRequiresUserGesture: false,
                                    debuggingEnabled: true,

                                  ),
                       ),
                     onWebViewCreated: (InAppWebViewController controller){
                       _controller=controller;
                     },

                     onProgressChanged: (InAppWebViewController controller,int progress){
                      //changing the linear progress  
                        setState(() {
                            this.progress=progress/100; 
                          });

                     },
                   ),
                 ),
               ),
             ],
           ),
         )
      // WebView(
      //     //passing url of the web page that is fetched from the Api 
      //     javascriptMode: JavascriptMode.unrestricted,
      //     initialUrl: this.article.url, 
      // //    WebView.addJavascriptInterface()
      
      //   ), 
    );
  }
}