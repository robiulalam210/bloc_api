import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/user_information_model.dart';

class ApiServices {
  List<UserInformation> userdata=[];
  Future<List<UserInformation>?> getData() async {
    final Dio dio=Dio();
    try {
      Response response=await dio.get("https://jsonplaceholder.typicode.com/posts");

      if(response.statusCode==200){
        var data=await response.data;
        data.forEach((e){
          var information=UserInformation.fromJson(e);
          userdata.add(information);


        });
        return userdata;
      }else{
       return [];
      }
    } catch (e) {}
  }
}
