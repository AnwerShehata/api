  import 'package:flutter/material.dart';
  import './ToolsApp/StyleApp.dart';
  import './ToolsApp/WidgetApp.dart';
  import '../View/page_addData.dart';
  import '../View/showData.dart';
  import '../Control/DataBaseHelper.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import '../View/login.dart';



  class dashborder extends StatefulWidget {
    final String title;
    const dashborder({Key key, this.title}) : super(key: key);
    _BirdState createState() => new _BirdState();
  }

  class _BirdState extends State<dashborder> {

    DataBaseHelper dataBaseHelper = new DataBaseHelper();
    ItemList item = new ItemList();

    _save(String token) async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
    }


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          appBar: AppBar(
            elevation: 0,
            title: Text("dashborder"),
            backgroundColor: anRed,
            leading: IconButton(icon: Icon(Icons.cancel), onPressed: (){
              _save('0');
              Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);
            }),
          ),


            floatingActionButton: new FloatingActionButton(
              child: new Icon(Icons.add),
              backgroundColor: anRed,
              elevation: 3,
              onPressed: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new page_addData(),)
              )),


            body: new FutureBuilder<List>(
              future: dataBaseHelper.getData(),
              builder: (context ,snapshot){
                if(snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new ItemList(list: snapshot.data)
                    : new Center(child: new CircularProgressIndicator(),);
              },
            )
        ),
      );

  }
  }




  class ItemList extends StatelessWidget {

    String formatDateTime(DateTime dateTime) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }

    List list;
    ItemList({this.list});
    @override
    Widget build(BuildContext context) {
      return ListView.separated(
        itemCount: list == null ? 0 : list.length,
        separatorBuilder: (context,int i) => Divider(),
        itemBuilder: (context ,int i){

          return ListTile(
            title: Text(list[i]['name']),
            subtitle: Text('price: ${list[i]['price']}'),
            leading: Icon(Icons.apps),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              showData(list: list, index: i,)),);
            },
          );
        },
      );}

  }


/*
  return new ListView.builder(
  itemCount: list==null?0:list.length,
  itemBuilder: (context,i){
  return new Container(
  padding: const EdgeInsets.symmetric(horizontal: 5),
  child: new GestureDetector(
  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)
  => new showData(list:list , index:i,) ),

  ) ,
  child: new Card(
  color: anGrey,
  child: new ListTile(
  title: new Text(list[i]['name']),
  leading: new Icon(Icons.apps),
  subtitle: new Text('Price : ${list[i]['price']}'),
  ),
  )
  ,
  ),
  );

  }
  );
*/



