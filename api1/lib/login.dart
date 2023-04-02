import 'package:api1/services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             SizedBox(height: 50,),
                TextFormField(
                  controller: emailC,
                  
                ),
                 TextFormField(
              controller: passC,
            ),
            ElevatedButton(
              onPressed: () {
                Api().loginApi(
                  emailC.text,
                  passC.text,

                  
                );
              },
            child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
