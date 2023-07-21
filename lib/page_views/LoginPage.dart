import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:not_paylas/model/Account.dart';
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  late String email, pass;
  String id = "g@gmail.com";
  String password = "123";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(controller: ScrollController(initialScrollOffset: 0),
        child: Container(height: MediaQuery.of(context).size.height,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 100,),
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            autofocus: true,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "email",
                                  style: TextStyle(color: Colors.white),
                                )),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return EmailValidator.validate(value!)
                                  ? null
                                  : "Undefined Email";
                            },
                            onSaved: (value) {
                              email = value!;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            textInputAction: TextInputAction.go,
                            cursorColor: Colors.white,
                            onSaved: (value) {
                              pass = value!;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "password",
                                  style: TextStyle(color: Colors.white),
                                )),
                            validator: (value) {
                              return value!.isEmpty ? "Şifre Giriniz" : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Colors.white,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / 1.5, 40)),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                print("savelendi");
                                if (pass == password && email == id) {
                                  var account =
                                      new Account(email: email, pass: pass);
                                  Navigator.pushReplacementNamed(
                                      context, "/",
                                      arguments: account);
                                  print("pushlandı");
                                } else {
                                  formkey.currentState!.reset();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Email veya şifre hatalı")));
                                  print("RESETLENDİ  " +
                                      "email:" +
                                      email +
                                      "  pass:" +
                                      pass);
                                  email = "";
                                  pass = "";
                                }
                              } else {
                                formkey.currentState!.reset();
                                print("resetlendi");
                              }
                            },
                            child: Text(
                              "Giriş",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
