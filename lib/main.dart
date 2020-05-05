  import 'package:flutter/material.dart';
  import './View/login.dart';
  import './View/register.dart';
  import './View/page_addData.dart';
  import './View/showData.dart';
  import './View/dashborder.dart';


  void main ()=> runApp(MyApp());
  
  class MyApp extends StatefulWidget {
    _BirdState createState() => new _BirdState();
  }

  class _BirdState extends State<MyApp> {

    final String title = "";


    @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,

        home: login(title: title),

        routes: <String , WidgetBuilder>{
          "/dashborder" : (BuildContext context) => new dashborder(title: title,),
          "/showData" : (BuildContext context) => new showData(),
          "/addData" : (BuildContext context) => new page_addData(title: title,),
          "/register" :(BuildContext context) => new register(title: title,),
        },

      );
    }
  }

