  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';


  //===get Data From API ==========================================
  Future<List> getData()async{
    String myUrl = "http://instadealco.com/flu/public/api/products/";
    http.Response response= await http.get(myUrl , headers: {
      "Accept" : "application/json",
      "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjVkZDE3NzE0MzYwYjI5NzQ1ZDFmMzUxMGE4MWE1YmIxNDFmNzBjNDRhZTg1ZjBjODU5NDE3NTk1ZGUwMTM1YTQxNWRiZjc2MTZlZTRkOTAxIn0.eyJhdWQiOiIzIiwianRpIjoiNWRkMTc3MTQzNjBiMjk3NDVkMWYzNTEwYTgxYTViYjE0MWY3MGM0NGFlODVmMGM4NTk0MTc1OTVkZTAxMzVhNDE1ZGJmNzYxNmVlNGQ5MDEiLCJpYXQiOjE1ODU5NDY4OTQsIm5iZiI6MTU4NTk0Njg5NCwiZXhwIjoxNjE3NDgyODk0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.DYq0GDGcFKA7TYt2O8QWQW520Ky8d-oaN712bCHQEcrEEupBjyq41REFxW3Y_B4u1N6xj306vpMiYCE2HGckE9KHD2_5a_Hujs32-Bf_xfRuMfsdZLC0Y-46xNbwOubF_AjI0Qb9IRd07fPLc2cJrwRZHpIOVNle9-mbNWIFQ-gXpS2LCJwVw7qFaXPGOOJ7iVFhJG6IwznQwym5WL2OHUE7BjuhCfucsDhoDGDrcg_1JoOHKWbzBPTnOetClOZesF_Vb4Z3JWuTE0H0rksC__y7wKMVPkFfvpxyFOKpEv3d94AfPEoBEpG_sPnE_xMvGEKBcIaubk-Dq7bRhLaf78Fk0m5ody1uiSjRUm0GGUThYdCjQV5febwpxzbsi1SayAUi5RrZgWIomV0CrA_J7hb2Lr4ffHEWLo5UaCVnvouh216Nvk0zOIQ-HPYqGjsGgNSuaxNwsjNybhRzm1wc2sJj5Y88HxoXpEepb7gUasAZFrGZUKUDq1srHZTIPtK4Ry72WslSoqiZwySY1ZvFmYFocATPE9VvVQMX94csFiOxJzoW9CLo5Pfr7_BJvcWaXK8HrvmkXUMSzehI-y1KoAgPLZf4OXmyY5Zd-wCjf9LCChoIDK3WmDUi75uFaJywfx98_lALJiTrAYB4-ogy0CVDnxjIzyzIJqQMJs-8wZY",
    },);
    return json.decode(response.body);
  }


  //===Add Data To API ==========================================
  void addData (){
    String myUrl = "http://instadealco.com/flu/public/api/products";
    http.post(myUrl ,
        headers: {
          "Accept" : "application/json",
          "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjVkZDE3NzE0MzYwYjI5NzQ1ZDFmMzUxMGE4MWE1YmIxNDFmNzBjNDRhZTg1ZjBjODU5NDE3NTk1ZGUwMTM1YTQxNWRiZjc2MTZlZTRkOTAxIn0.eyJhdWQiOiIzIiwianRpIjoiNWRkMTc3MTQzNjBiMjk3NDVkMWYzNTEwYTgxYTViYjE0MWY3MGM0NGFlODVmMGM4NTk0MTc1OTVkZTAxMzVhNDE1ZGJmNzYxNmVlNGQ5MDEiLCJpYXQiOjE1ODU5NDY4OTQsIm5iZiI6MTU4NTk0Njg5NCwiZXhwIjoxNjE3NDgyODk0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.DYq0GDGcFKA7TYt2O8QWQW520Ky8d-oaN712bCHQEcrEEupBjyq41REFxW3Y_B4u1N6xj306vpMiYCE2HGckE9KHD2_5a_Hujs32-Bf_xfRuMfsdZLC0Y-46xNbwOubF_AjI0Qb9IRd07fPLc2cJrwRZHpIOVNle9-mbNWIFQ-gXpS2LCJwVw7qFaXPGOOJ7iVFhJG6IwznQwym5WL2OHUE7BjuhCfucsDhoDGDrcg_1JoOHKWbzBPTnOetClOZesF_Vb4Z3JWuTE0H0rksC__y7wKMVPkFfvpxyFOKpEv3d94AfPEoBEpG_sPnE_xMvGEKBcIaubk-Dq7bRhLaf78Fk0m5ody1uiSjRUm0GGUThYdCjQV5febwpxzbsi1SayAUi5RrZgWIomV0CrA_J7hb2Lr4ffHEWLo5UaCVnvouh216Nvk0zOIQ-HPYqGjsGgNSuaxNwsjNybhRzm1wc2sJj5Y88HxoXpEepb7gUasAZFrGZUKUDq1srHZTIPtK4Ry72WslSoqiZwySY1ZvFmYFocATPE9VvVQMX94csFiOxJzoW9CLo5Pfr7_BJvcWaXK8HrvmkXUMSzehI-y1KoAgPLZf4OXmyY5Zd-wCjf9LCChoIDK3WmDUi75uFaJywfx98_lALJiTrAYB4-ogy0CVDnxjIzyzIJqQMJs-8wZY",
        },
        body: {
          "name": "asdf",
          "price": "66775",
        }).then((response){
      // طباعة البيانات بعد عملت الاضافة
      print("statusCode : ${response.statusCode}");
      print("body : ${response.body}");
    });
  }

  //===Edit Data To API ==========================================
  void editData (){
    int id = 18 ;
    String myUrl = "http://instadealco.com/flu/public/api/products/$id";
    http.put(myUrl ,
        headers: {
          "Accept" : "application/json",
          "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjVkZDE3NzE0MzYwYjI5NzQ1ZDFmMzUxMGE4MWE1YmIxNDFmNzBjNDRhZTg1ZjBjODU5NDE3NTk1ZGUwMTM1YTQxNWRiZjc2MTZlZTRkOTAxIn0.eyJhdWQiOiIzIiwianRpIjoiNWRkMTc3MTQzNjBiMjk3NDVkMWYzNTEwYTgxYTViYjE0MWY3MGM0NGFlODVmMGM4NTk0MTc1OTVkZTAxMzVhNDE1ZGJmNzYxNmVlNGQ5MDEiLCJpYXQiOjE1ODU5NDY4OTQsIm5iZiI6MTU4NTk0Njg5NCwiZXhwIjoxNjE3NDgyODk0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.DYq0GDGcFKA7TYt2O8QWQW520Ky8d-oaN712bCHQEcrEEupBjyq41REFxW3Y_B4u1N6xj306vpMiYCE2HGckE9KHD2_5a_Hujs32-Bf_xfRuMfsdZLC0Y-46xNbwOubF_AjI0Qb9IRd07fPLc2cJrwRZHpIOVNle9-mbNWIFQ-gXpS2LCJwVw7qFaXPGOOJ7iVFhJG6IwznQwym5WL2OHUE7BjuhCfucsDhoDGDrcg_1JoOHKWbzBPTnOetClOZesF_Vb4Z3JWuTE0H0rksC__y7wKMVPkFfvpxyFOKpEv3d94AfPEoBEpG_sPnE_xMvGEKBcIaubk-Dq7bRhLaf78Fk0m5ody1uiSjRUm0GGUThYdCjQV5febwpxzbsi1SayAUi5RrZgWIomV0CrA_J7hb2Lr4ffHEWLo5UaCVnvouh216Nvk0zOIQ-HPYqGjsGgNSuaxNwsjNybhRzm1wc2sJj5Y88HxoXpEepb7gUasAZFrGZUKUDq1srHZTIPtK4Ry72WslSoqiZwySY1ZvFmYFocATPE9VvVQMX94csFiOxJzoW9CLo5Pfr7_BJvcWaXK8HrvmkXUMSzehI-y1KoAgPLZf4OXmyY5Zd-wCjf9LCChoIDK3WmDUi75uFaJywfx98_lALJiTrAYB4-ogy0CVDnxjIzyzIJqQMJs-8wZY",
        },
        body: {
          "name": "Ali1213",
          "price": "5521",
        }).then((value){
      print("statusCode: ${value.statusCode}");
      print("body : ${value.body}");
    });
  }


  //===delete Data To API ==========================================
  void deleteData (){
    int id = 19;
    String myUrl = "http://instadealco.com/flu/public/api/products/$id";
    http.delete(myUrl ,
      headers: {
        "Accept" : "application/json",
        "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjVkZDE3NzE0MzYwYjI5NzQ1ZDFmMzUxMGE4MWE1YmIxNDFmNzBjNDRhZTg1ZjBjODU5NDE3NTk1ZGUwMTM1YTQxNWRiZjc2MTZlZTRkOTAxIn0.eyJhdWQiOiIzIiwianRpIjoiNWRkMTc3MTQzNjBiMjk3NDVkMWYzNTEwYTgxYTViYjE0MWY3MGM0NGFlODVmMGM4NTk0MTc1OTVkZTAxMzVhNDE1ZGJmNzYxNmVlNGQ5MDEiLCJpYXQiOjE1ODU5NDY4OTQsIm5iZiI6MTU4NTk0Njg5NCwiZXhwIjoxNjE3NDgyODk0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.DYq0GDGcFKA7TYt2O8QWQW520Ky8d-oaN712bCHQEcrEEupBjyq41REFxW3Y_B4u1N6xj306vpMiYCE2HGckE9KHD2_5a_Hujs32-Bf_xfRuMfsdZLC0Y-46xNbwOubF_AjI0Qb9IRd07fPLc2cJrwRZHpIOVNle9-mbNWIFQ-gXpS2LCJwVw7qFaXPGOOJ7iVFhJG6IwznQwym5WL2OHUE7BjuhCfucsDhoDGDrcg_1JoOHKWbzBPTnOetClOZesF_Vb4Z3JWuTE0H0rksC__y7wKMVPkFfvpxyFOKpEv3d94AfPEoBEpG_sPnE_xMvGEKBcIaubk-Dq7bRhLaf78Fk0m5ody1uiSjRUm0GGUThYdCjQV5febwpxzbsi1SayAUi5RrZgWIomV0CrA_J7hb2Lr4ffHEWLo5UaCVnvouh216Nvk0zOIQ-HPYqGjsGgNSuaxNwsjNybhRzm1wc2sJj5Y88HxoXpEepb7gUasAZFrGZUKUDq1srHZTIPtK4Ry72WslSoqiZwySY1ZvFmYFocATPE9VvVQMX94csFiOxJzoW9CLo5Pfr7_BJvcWaXK8HrvmkXUMSzehI-y1KoAgPLZf4OXmyY5Zd-wCjf9LCChoIDK3WmDUi75uFaJywfx98_lALJiTrAYB4-ogy0CVDnxjIzyzIJqQMJs-8wZY",
      },).then((value){
      print("statusCode : ${value.statusCode}");
      print("body : ${value.body}");
    });
  }


  //===login Data To API ==========================================
  void loginData(){
    String myUrl = "http://instadealco.com/flu/public/api/login1";
    http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "email": "anwerapp522@gmail.com",
          "password" : "11223355"
        } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');

      Map mapValue  = json.decode(response.body);
      print("value token ${mapValue.values.toString()}");
    });
  }


  //===register Data To API ==========================================
  void registerData(){
    String myUrl = "http://instadealco.com/flu/public/api/register1";
    http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name":"anwerapp22",
          "email":"anwerapp522@gmail.com",
          "password":"11223355"
        } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');

      Map mapValue  = json.decode(response.body);
      print("value token ${mapValue.values.toString()}");
    });
  }


