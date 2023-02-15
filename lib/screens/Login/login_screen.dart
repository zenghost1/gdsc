// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "SIGN IN",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          "SIGN UP",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.alternate_email,
                              color: Color(0xFFFFBD73),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              // controller: email,
                              decoration: const InputDecoration(
                                hintText: "Email Address",
                              ),
                              validator: (value) {
                                if (value == "test@admin.com") {
                                  return null;
                                } else {
                                  return "email doesn't match";
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.lock,
                            color: Color(0xFFFFBD73),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            // controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Password",
                            ),
                            validator: (value) {
                              if (value == "12345678") {
                                return null;
                              } else {
                                return "password doesn't match";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: <Widget>[
                          const Spacer(),
                          FloatingActionButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //       content: Text('Login Successful')),
                                // );
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/error');
                              }
                            },
                            backgroundColor: Color(0xFFFFBD73),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
