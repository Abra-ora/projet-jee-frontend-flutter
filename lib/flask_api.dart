import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'module/graph.dart';

class flaskApi {
  static final _client = http.Client();
  static final String flask_url = "http://10.0.2.2:5000/graphs";

  static Future<List<dynamic>> getGraphs() async {
    final response = await http.get(Uri.parse(flask_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // .cast<Map<String, dynamic>>();
      return data;
      // return data.map<graph>((json) => graph.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load graphs');
    }
  }
}
