import 'package:flutter/material.dart';
import './ToolsApp/StyleApp.dart';
import './ToolsApp/WidgetApp.dart';
import '../Control/DataBaseHelper.dart';
import '../View/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../View/dashborder.dart';

class login extends StatefulWidget {
  final String title ;
  const login({Key key, this.title}) : super(key: key);
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<login> {

  DataBaseHelper dataBaseHelper = new DataBaseHelper();
  String msgStauts ='';

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  read()async{
    final preferences= await SharedPreferences.getInstance();
    final key  = "value";
    final value   =  preferences.get(key) ?? 0;
    if(value != 0){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> dashborder()));
    }
  }


  @override
  void initState() {
    super.initState();
    read();
  }



  _onPressed(){
    setState(() {
      if(_email.text.trim().toLowerCase().isNotEmpty && _password.text.trim().isNotEmpty)
      {
      dataBaseHelper.loginData(
      email: _email.text.trim().toLowerCase() ,
      password: _password.text.trim()
      ).whenComplete((){
        //   whenComplete يقوم تنفيذ هذا الكود بعد عملية تسجل الدخول

        if(dataBaseHelper.status){
          // اذا كانت عملية تسجيل الدخول تحمل خطاً تظهر رسالة showDilog
          showDilog();
          msgStauts ="check your email or password";
        }else{
          // اذا كانت عملت تسجيل ناجحة انتقل الي الصفحة التالية
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
          elevation: 0,
          backgroundColor: anRed,
          title: Text("Test Api33"),
        ),


        body: ListView(
          children: <Widget>[

            SizedBox(height: 100,),
            new Text("Welcome To Login ",style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,),

            SizedBox(height: 60,),
            my_TextFieldMaterial(elevation: 0 , horizontal: 20 ,TextInput: TextInputType.emailAddress,
            controllers: _email , prefixIcon: Icons.account_circle ,HintText: "Email"),

            my_TextFieldMaterial(elevation: 0 , horizontal: 20 ,vertical: 10,TextInput: TextInputType.text,
            controllers: _password , prefixIcon: Icons.lock_open ,HintText: "Password"),

            my_Button(horizontal: 20 , vertical: 10, onBtnclicked: _onPressed , textButton: "Login" ,
            fontSize: 25 , colorButton: anRed),

            SizedBox(height: 20),
            InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => register()),);},
              child: new Text("Create new Account" ,style: TextStyle(fontSize:17),
              textAlign: TextAlign.center,),
            ),
            



          ],
        ),


      ),
    );
  }

  void showDilog() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Feilde"),
          content: new Text("check your Email or Password"),
          actions: <Widget>[
            my_Button(onBtnclicked: (){ Navigator.pop(context);} , textButton: "Close")
          ],
        );
      }
    );
  }
}