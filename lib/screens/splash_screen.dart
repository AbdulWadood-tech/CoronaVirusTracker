import 'dart:async';

import 'package:api_models/screens/world_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), ()=>
    Navigator.push(context, MaterialPageRoute(builder: (context)=>world_states() ) ));

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Text('Designed by Software Priests', textAlign: TextAlign.center,),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/covid.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Covid 19 \n Tracker', style: TextStyle( fontSize: 40),),

            ],
          ),
        ),
      ),
    );
  }
}
