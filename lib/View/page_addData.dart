import 'package:flutter/material.dart';
import './ToolsApp/WidgetApp.dart';
import './ToolsApp/StyleApp.dart';
import '../Control/DataBaseHelper.dart';
import '../View/dashborder.dart';


class page_addData extends StatefulWidget {
  final String title;
  const page_addData({Key key, this.title}) : super(key: key);
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<page_addData> {
  DataBaseHelper dataBaseHelper = new DataBaseHelper();

  final TextEditingController _nameControl = new TextEditingController();
  final TextEditingController _priceControl = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor:anRed,
          title: Text("Add Data To APi"),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:(){Navigator.pop(context);}),
        ),


        body: ListView(
          children: <Widget>[

            SizedBox(height: 70),
            my_TextFieldMaterial(horizontal: 20 , elevation: 0,  controllers: _nameControl,maxLines: 5 ,Radius: 10 ,labelText: "Name Item" , prefixIcon: Icons.edit),
            SizedBox(height: 10),
            my_TextFieldMaterial(horizontal: 20 , elevation: 0, controllers: _priceControl ,Radius: 10 ,labelText: "Price Item" , prefixIcon: Icons.domain , ),

            my_Button(horizontal: 20 ,vertical: 20 ,heightButton: 60,
              textButton: "Add Item",fontSize: 20,radiusButton: 20,colorButton: anRed,
              onBtnclicked: (){
              dataBaseHelper.addData(name: _nameControl.text.trim(),price:_priceControl.text);
              Navigator.push(context, MaterialPageRoute(builder: (context) => dashborder()),);
            })


          ],
        ),





      ),
    );
  }
}