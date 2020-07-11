import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupworldtime() async{
  //worldTime objesi oluşturup async olarak çağırıyoruz. Bu .ağrı sırasında loading page geliyor. Bitince /home a gidiyoruz!
  WorldTime worldtime = WorldTime(location:'Berlin',flag:'germany',url:'Europe/Berlin');
  await worldtime.gettime();

    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location':worldtime.location,
      'time':worldtime.time,
      'flag':worldtime.flag,
      'isDayTime':worldtime.isDayTime,
    });



}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupworldtime();



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitWave (
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.yellowAccent : Colors.green,
              ),
            );
          },
        ),

      ),

    );
  }
}
