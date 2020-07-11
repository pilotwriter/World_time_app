import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

String location;//location for ui
String time;//time ui
String flag;//url to asset
String url; //api url for each city
bool isDayTime;//true day false night

WorldTime({this.location,this.flag,this.url});



Future<void> gettime()async {
  try {
    //Make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);



    //get properties from data
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1, 3);


    //create a date time
    DateTime now = DateTime.parse(data['utc_datetime']);
    print(data['utc_offset']);

    if(data['utc_offset'].toString().startsWith("+")) {
      now = now.add(Duration(hours: int.parse(offset)));
    }
    else{
      now = now.subtract(Duration(hours: int.parse(offset)));

    }
    isDayTime = now.hour >6 && now.hour < 20 ? true : false;
    //set the time property
    time = DateFormat.jm().format(now);


  }
  catch (e){
    time = 'time can not be reached';
    print('error occured : $e');
}


}

}

