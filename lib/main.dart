import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          decoration: InputDecoration(hintText: 'Email'),
          onChanged: (value) => email = value,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Password'),
          onChanged: (value) => password = value,
        ),
        ElevatedButton(
          onPressed: () {
            http
                .post(
                  Uri.http('localhost:8080', '/login'),
                  headers: {'Content-type': 'application/json'},
                  body: jsonEncode({'email': email, 'password': password}),
                )
                .then((value) => print(value.body));
          },
          child: Text('Login'),
        )
      ]),
    );
  }
}
