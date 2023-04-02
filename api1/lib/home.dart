import 'package:api1/login.dart';
import 'package:api1/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confPassC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50,),
            TextFormField(
              controller: nameC,
            ),
            TextFormField(
              controller: emailC,
            ),
            TextFormField(
              controller: passC,
            ),
            TextFormField(
              controller: confPassC,
            ),
            ElevatedButton(
              onPressed: () {
                Api().registerApi(
                  emailC.text,
                  passC.text,
                  nameC.text,
                  confPassC.text,
                );
              },
              child: Text("Register"),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return Login();
              }));
            }, child: Text("Go to Login"))
          ],
        ),
      ),
    );
  }
}
