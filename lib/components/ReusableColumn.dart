import 'package:flutter/material.dart';


class MyColumn extends StatelessWidget {

  MyColumn({required this.title,
    required this.data});
    String title,data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 20)),
              Text(data, style: TextStyle(fontSize: 20),)
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Divider(
            thickness: 2,
          ),
        )

      ],
    );
  }
}
