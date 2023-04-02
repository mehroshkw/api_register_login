import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  String baseUrl = "https://btrlaravel.stepinnsolution.com/api/register";
  String baseUrlLogin = "https://btrlaravel.stepinnsolution.com/api/login";

  Future<void> registerApi(
      String email, String password, String name, String cPass) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "name": name,
            "confirm_password": cPass,
            "email": email,
            "password": password
          },
        ));
    print(response.body.toString());
  }

  Future<void> loginApi(
    String email,
    String password,
  ) async {
    final response = await http.post(Uri.parse(baseUrlLogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"email": email, "password": password},
        ));
    print(response.body.toString());
  }
}
