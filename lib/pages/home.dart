import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
      data = ModalRoute.of(context).settings.arguments;
      print(data);

      String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
      Color bgColor = data['isDayTime'] ? Colors.lightBlue : Colors.blue[900];


    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                    icon: Icon(Icons.edit_location,
                    color:Colors.grey[300],


                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 35,
                        color:Colors.grey[300],
                      ),
                    )),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 39,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                    )
                  ],
                ),
                SizedBox(height: 28,),

                Text(data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white,

                ),),


              ],

            ),
          ),
        ),
      )
    );
  }
}
