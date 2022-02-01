
import 'package:flutter/foundation.dart';

class User {

  int id;
  String username;
  String email;
  String password;
  String type;
  String token;
  String renewalToken;

  User(this.username, this.email, this.password, this.token,
      this.renewalToken) {
  }

}