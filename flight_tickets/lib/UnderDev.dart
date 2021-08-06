import 'package:flutter/material.dart';

class UnderDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100.0),
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Image.asset(
              './assets/images/working.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Working on this page !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Oxygen',
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
