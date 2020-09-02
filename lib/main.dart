import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickie/ViewModels/newsArticleListViewModel.dart';
import 'pages/NewsListPage.dart';
import 'dart:async';
import 'package:flutter/services.dart';
//void main() =>runApp(MyApp());


Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.landscapeLeft]);
  WidgetsFlutterBinding.ensureInitialized();
 // await Permission.camera.request();
//  await Permission.microphone.request();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsArticleListViewModel>(
     create:  (_)=>NewsArticleListViewModel(), 
          child: MaterialApp(
        title: 'Quick Summary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:Colors.teal,
        //  accentColor:Colors.tealAccent,
        ),
        home:NewsListPage(),
        // routes: <String, WidgetBuilder>{
        //   "/InputScreen":(BuildContext context) =>InputScreen(),
        // },
      )
    );
  }
}