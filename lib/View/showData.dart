import 'package:flutter/material.dart';
import './ToolsApp/StyleApp.dart';
import './ToolsApp/WidgetApp.dart';
import '../Control/DataBaseHelper.dart';
import '../View/editeData.dart';
import '../View/dashborder.dart';

class showData extends StatefulWidget {
  List list ;
  int index;
  showData({this.list ,this.index}) ;

  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<showData> {

  DataBaseHelper dataBaseHelper = new DataBaseHelper();
  final TextEditingController _nameControl = new TextEditingController();
  final TextEditingController _priceControl= new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        appBar: AppBar(
          elevation: 0,
          title: Text("Show Data "),
          backgroundColor: anRed,
          leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
          }),
        ),

        body: ListView(
          padding: EdgeInsets.only(left: 30),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100,),
                new Text("name : ${widget.list[widget.index]["name"]}",style: TextStyle(fontSize: 35),),
                new Text("price : ${widget.list[widget.index]["price"]}",style: TextStyle(fontSize: 20),),
                new Text("user_id : ${widget.list[widget.index]["user_id"]}",style: TextStyle(fontSize: 20),),
                new Text("created: ${widget.list[widget.index]["created_at"]}",style: TextStyle(fontSize: 20),),
                new Text("updated :${widget.list[widget.index]["updated_at"]}",style: TextStyle(fontSize: 20),),

                new SizedBox(height: 200),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    //========== Button Delete Daat ======================
                    my_ButtonIcon(horizontal: 20 , textButton: "Delete" ,
                      icon: Icons.delete,fontSize: 20 , colorButton: anRed,
                      onPressed: (){
                      dataBaseHelper.deleteData(widget.list[widget.index]['id']);
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>dashborder()),);
                      }),

                    //========== Button Edite Daat ======================
                    my_ButtonIcon(vertical: 10 , textButton: "Edite" ,icon: Icons.edit, fontSize: 20 ,
                    colorButton: Colors.green, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => editeData(list: widget.list, index: widget.index,)),);
                     }),
                  ],
                )

              ],
            )
          ],
        ),

      ),
    );
  }
}