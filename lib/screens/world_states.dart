import 'dart:convert';
import 'package:api_models/components/ReusableColumn.dart';
import 'package:api_models/models/WorldStatesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'countries_list.dart';

class world_states extends StatefulWidget {
  const world_states({Key? key}) : super(key: key);

  @override
  _worldState createState() => _worldState();
}

class _worldState extends State<world_states> {

  void initState() {
    // TODO: implement initState
    super.initState();
    _getWorldRecords();

  }

  Future<WorldStatesModel> _getWorldRecords() async {
    var response =
    await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      return WorldStatesModel.fromJson(data);
    }
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
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Image.asset('images/covid.png',
            height: 150,
            width: 150,),

            SizedBox(
              height: 20,
            ),

            Text('World States', style: TextStyle(fontSize: 30)),

            SizedBox(
              height: 30,
            ),
            FutureBuilder<WorldStatesModel>(
              future: _getWorldRecords(),
                builder: (context,snapshot){
                return Card(
                  child: Column(
                    children: [
                      MyColumn(title: 'Active Cases', data: snapshot.data!.active.toString()),
                      MyColumn(title: 'Deaths', data: snapshot.data!.deaths.toString()),
                      MyColumn(title: 'Recovered', data: snapshot.data!.recovered.toString()),
                      MyColumn(title: 'Critical Cases', data: snapshot.data!.critical.toString()),
                      MyColumn(title: 'World Population  ', data: snapshot.data!.population.toString()),
                    ],
                  ),
                );
                },
            ),

            SizedBox(
              height: 20,
            ),
            Material(
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesList()));
                },
                child:
                Text('Countries Tracker', style: TextStyle( color: Colors.white, fontSize: 15),),
              ),
            ),



          ],
        ),
        ),

      ),);
  }
}

