import 'package:flutter/material.dart';
import './ToolsApp/StyleApp.dart';
import './ToolsApp/WidgetApp.dart';
import '../Control/DataBaseHelper.dart';
import '../View/dashborder.dart';

class editeData extends StatefulWidget {
  List list ;
  int index;
  editeData({this.list ,this.index}) ;
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<editeData> {
  DataBaseHelper dataBaseHelper = new DataBaseHelper();
  TextEditingController _nameControl ;
  TextEditingController _priceControl ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameControl = new TextEditingController(text:widget.list[widget.index]['name']);
    _priceControl = new TextEditingController(text:widget.list[widget.index]['price']);
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: anRed,
          title: Text("Updata Data"),
        ),


        body: ListView(
          children: <Widget>[

            my_TextFieldMaterial(horizontal: 20 ,vertical: 30 , elevation: 0 , controllers: _nameControl , HintText: "Name Producte"),
            my_TextFieldMaterial(horizontal: 20 ,vertical: 0, elevation: 0 , controllers: _priceControl , HintText: "Price Producte"),

            my_ButtonIcon(horizontal: 20 ,textButton: "Updata Data" ,icon: Icons.update ,
            colorButton: anRed ,onPressed: (){
              dataBaseHelper.editData(
                  ID: widget.list[widget.index]['id'],
                  name:_nameControl.text.trim() ,
                  price: _priceControl.text.trim());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> dashborder()));
                })

          ],
        ),



      ),
    );
  }
}