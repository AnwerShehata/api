  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:shared_preferences/shared_preferences.dart';
  import '../View/login.dart';


  class DataBaseHelper{
    login log = new login();
    String serverURL = "http://instadealco.com/flu/public/api";
    var status ;
    var token ;

    //===login Data To API ==========================================
    loginData({String email,password})async{
      String myUrl = "$serverURL/login1";
      final response = await http.post(myUrl,
          headers: {
            'Accept':'application/json'
          },
          body: {
            "email": "$email",
            "password" : "$password"
          });
      status = response.body.contains("error");
      var data = json.decode(response.body);

      // اذا كان البيانات ترجعerror اطبع الخطاء الذي يرجع من السيرفر
      if(status){
        print("Data : ${data["error"]}");
      }
      // اذا كان البيانات ترجعtoken اطبع قيمة التوكين  التي ترجع من السيرفر
      else{
        print("Data : ${data["token"]}");
        //هنا يتم حفظ الــtoken الخاص بالمستخدم الذي ياتي من السيرفر
        _Saved(data["token"]);
      }
    }


    //===register Data To API ==========================================
    registerData({String  name,email,password})async{
      String myUrl = "$serverURL/register1";
      final response = await http.post(myUrl,
          headers: {
            'Accept':'application/json'
          },
          body: {
            "name": "$name",
            "email": "$email",
            "password" : "$password"
          });
      status = response.body.contains("error");
      var data = json.decode(response.body);

      // اذا كان البيانات ترجعerror اطبع الخطاء الذي يرجع من السيرفر
      if(status){
        print("Data : ${data["error"]}");
      }
      // اذا كان البيانات ترجعtoken اطبع قيمة التوكين  التي ترجع من السيرفر
      else{
        print("Data : ${data["token"]}");
        //هنا يتم حفظ الــtoken الخاص بالمستخدم الذي ياتي من السيرفر
        _Saved(data["token"]);
      }
    }


    //===get Data From API ==========================================
    Future<List> getData()async{

      final preferences= await SharedPreferences.getInstance();
      final key  = "value";
//      سوف يتم حفط الــ Token الخاص بالمستخدم هنا في value
//      ويتم ارسالة الي Bearer لجلب المنتجات التي قام المستخدم بائنشائها
      final value   =  preferences.get(key) ?? 0;

      String myUrl = "$serverURL/products";
      http.Response response= await http.get(myUrl , headers: {
        "Accept" : "application/json",
        "Authorization":"Bearer $value"
      },);
      return json.decode(response.body);
    }


    //===delete Data To API ==========================================
     deleteData (int ID)async{
      final preferences= await SharedPreferences.getInstance();
      final key  = "value";
//      سوف يتم حفط الــ Token الخاص بالمستخدم هنا في value
//      ويتم ارسالة الي Bearer لجلب المنتجات التي قام المستخدم بائنشائها
      final value   =  preferences.get(key) ?? 0;

      String myUrl = "$serverURL/products/$ID ";
      http.delete(myUrl ,
        headers: {
          "Accept" : "application/json",
          "Authorization":"Bearer $value"
        },).then((value){
        print("statusCode : ${value.statusCode}");
        print("body : ${value.body}");
      });
    }


    //===Add Data To API ==========================================
    addData ({String name ,String price})async{
      final preferences= await SharedPreferences.getInstance();
      final key  = "value";
//      سوف يتم حفط الــ Token الخاص بالمستخدم هنا في value
//      ويتم ارسالة الي Bearer لجلب المنتجات التي قام المستخدم بائنشائها
      final value   =  preferences.get(key) ?? 0;

      String myUrl = "$serverURL/products";
      http.post(myUrl ,
          headers: {
            "Accept" : "application/json",
            "Authorization":"Bearer $value"
          },
          body: {
            "name": "$name",
            "price": "$price",
          }).then((response){
        // طباعة البيانات بعد عملت الاضافة
        print("statusCode : ${response.statusCode}");
        print("body : ${response.body}");
      });
    }


    //===Edit Data To API ==========================================
    editData ({int ID , String name ,price})async{
      final preferences= await SharedPreferences.getInstance();
      final key  = "value";
//    سوف يتم حفط الــ Token الخاص بالمستخدم هنا في value
//    ويتم ارسالة الي Bearer لجلب المنتجات التي قام المستخدم بائنشائها
      final value   =  preferences.get(key) ?? 0;

      String myUrl = "$serverURL/products/$ID";
      http.put(myUrl ,
          headers: {
            "Accept" : "application/json",
            "Authorization":"Bearer $value"
          },
          body: {
            "name": "$name",
            "price": "$price",
          }).then((value){
        print("statusCode: ${value.statusCode}");
        print("body : ${value.body}");
      });
    }


    _Saved(String token)async{
     final preferences= await SharedPreferences.getInstance();
     final key  = "value";
     final value   =  token;
     preferences.setString(key, value);
    }

    read(String token)async{
     final preferences= await SharedPreferences.getInstance();
     final key  = "value";
     final value   =  preferences.get(key) ?? 0;
     print("read $value");
    }

  }


