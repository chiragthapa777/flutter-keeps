import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_keep/constants/global_variables.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void login(
      {required String email,
      required String password,
      required BuildContext ctx}) async {
    try {
      Map<String, String> body = {"password": password, "email": email};
      http.Response res = await http.post(Uri.parse('$baseUrl/user/login'),
          body: json.encode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var data = jsonDecode(res.body) as Map<String, dynamic>;
      print(data);
    } catch (e) {
      print(e.toString());
    }
  }
}
