import 'dart:convert';

import 'package:api_models/models/CountriesListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'countries_states.dart';

class CountriesList extends StatefulWidget {
  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {


  List<CountriesListModel> countriesList = [];

  Future<CountriesListModel> getCountriesList() async {
    var response =
    await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      setState(() {
        for (Map i in data) {
          countriesList.add(CountriesListModel.fromJson(i));
        }
      });
      return CountriesListModel.fromJson(data);
    } else {
      return CountriesListModel.fromJson(data);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCountriesList();

  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Countries List'),
      ),
      body: Column(
        children: [

      Expanded(
        child: ListView.builder(
        itemCount: countriesList.length,

            itemBuilder:(context,index){
          var data=countriesList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>countries_states(
                      name: countriesList[index].country.toString(), flag:countriesList[index].countryInfo!.flag.toString() ,
                    )));
                },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image(
                            image: NetworkImage(countriesList[index].countryInfo!.flag.toString()),
                            height: 70,
                              width: 70,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(countriesList[index].country.toString()),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      )

                    ],
                  ),
                ),
              );

            }),
      ),
        ],
      ) ,
    );

  }
}