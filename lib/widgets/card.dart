import 'package:flutter/material.dart';
import 'dart:math';

Card buildCard(String title, String imgName, String supportText) {
  var heading = title;
  var img = imgName;
  var supportingText = supportText;
  

  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading,
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            height: 200.0,
            child: Ink.image(
              image: AssetImage('assets/images/'+img),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
        ],
      ));
}
