import 'dart:convert';

import 'package:api_models/components/ReusableColumn.dart';
import 'package:api_models/models/countriesStatesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class countries_states extends StatefulWidget {

  countries_states({required this.name, required this.flag});
  String name;
  String flag;
  @override
  _countries_statesState createState() => _countries_statesState();
}

class _countries_statesState extends State<countries_states> {

  void initState() {
    // TODO: implement initState
    super.initState();
    _getStates();
  }

  Future<CountriesStatesModel> _getStates() async {
    var response = await http.get(Uri.parse(
        'https://disease.sh/v3/covid-19/countries/' + widget.name.toString()));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CountriesStatesModel.fromJson(data);
    } else {
      return CountriesStatesModel.fromJson(data);
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
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(widget.flag),
                  height: 70,
                  width: 70,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(widget.name),
              ],
            ),
          ),
          FutureBuilder<CountriesStatesModel>(
              future: _getStates(),
              builder: (context, snapshot) {
                print(snapshot.data);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                child: Column(
                  children: [
                    MyColumn(
                        title: 'Total Deaths',
                        data: snapshot.data!.deaths.toString()),
                    MyColumn(
                        title: 'Active Cases',
                        data: snapshot.data!.deaths.toString()),
                    MyColumn(
                        title: 'Recovered',
                        data: snapshot.data!.recovered.toString()),
                    MyColumn(
                        title: 'Today Cases',
                        data: snapshot.data!.todayCases.toString()),
                    MyColumn(
                        title: 'Today Deaths',
                        data: snapshot.data!.todayDeaths.toString()),
                  ],
                ),
              ),

            );
          }
          ),
        ],
      ),
    );
  }
}
