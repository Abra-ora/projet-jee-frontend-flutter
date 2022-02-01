import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum status{
  NotLogedIn,
  LogedIn,
  NotRegistred,
  Registred,
  Registring,
  LoggedOut,
  Authentification,
}
class api extends ChangeNotifier{
   bool state =false;
  final String baseUrl = 'http://10.0.2.2:8080/api/clients';
   status _LogedInStatus = status.NotLogedIn;
   status _RzgistredInStattus = status.NotRegistred;

   status get LogedInStatus => _LogedInStatus;

  set LogedInStatus(status value) {
    _LogedInStatus = value;
  }

  status get RzgistredInStattus => _RzgistredInStattus;

  set RzgistredInStattus(status value) {
    _RzgistredInStattus = value;
  }

  Future<http.Response> register(data) async {
    final String url = baseUrl+'/register';
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work"Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "PUT, GET, POST, DELETE, OPTIONS",
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
  }

   Future<http.Response> login(data) async {
     final String url = baseUrl+'/login';
     return await http.post(
         Uri.parse(url),
         body: jsonEncode(data),
         headers: {
           "Access-Control-Allow-Origin": "*", // Required for CORS support to work"Access-Control-Allow-Origin": "*",
           "Access-Control-Allow-Methods": "PUT, GET, POST, DELETE, OPTIONS",
           'Content-Type': 'application/json; charset=UTF-8',
         }
     );
   }
}