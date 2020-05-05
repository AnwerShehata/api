import 'package:flutter/material.dart';
import './ToolsApp/StyleApp.dart';
import './ToolsApp/WidgetApp.dart';
import '../Control/DataBaseHelper.dart';
import './login.dart';

class register extends StatefulWidget {
  final String title;
  const register({Key key, this.title}) : super(key: key);
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<register> {
  DataBaseHelper dataBaseHelper = new DataBaseHelper();
  String msgStauts ='';

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  _onPressed(){
    setState(() {
      if(
      _email.text.trim().toLowerCase().isNotEmpty &&
      _password.text.trim().isNotEmpty &&
      _userName.text.trim().isNotEmpty)
      {
        dataBaseHelper.registerData(
          name: _userName.text.trim(),
          email: _email.text.trim().toLowerCase(),
          password:_password.text.trim(),
        ).whenComplete((){
          if(dataBaseHelper.status){
            msgStauts ="check your email or password";
          }else{
            Navigator.pushReplacementNamed(context, '/dashborder');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        appBar: AppBar(
          backgroundColor: anRed,
          elevation: 0,
          title: Text("register",style: TextStyle(fontSize: 25),),
        ),


        body: ListView(
          children: <Widget>[

            SizedBox(height: 100,),
            new Text("Welcome To Register",style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,),

            SizedBox(height: 60,),
            my_TextFieldMaterial(elevation: 0 , horizontal: 20 ,TextInput: TextInputType.emailAddress,
                controllers: _userName , prefixIcon: Icons.account_circle ,HintText: "userName"),

            my_TextFieldMaterial(elevation: 0 , horizontal: 20 ,vertical: 10,TextInput: TextInputType.text,
                controllers: _email , prefixIcon: Icons.lock_open ,HintText: "email"),


            my_TextFieldMaterial(elevation: 0 , horizontal: 20 ,vertical: 10,TextInput: TextInputType.text,
                controllers: _password , prefixIcon: Icons.lock_open ,HintText: "password"),

            my_Button(horizontal: 20 , vertical: 10, onBtnclicked:_onPressed, textButton: "register" ,
                fontSize: 30 , colorButton: anRed),

            SizedBox(height: 20),
            InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);},
              child: new Text("you have account Login" ,style: TextStyle(fontSize:17),
                textAlign: TextAlign.center,),
            ),

          ],
        ),


      ),
    );
  }
}