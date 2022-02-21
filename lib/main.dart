import 'package:flutter/material.dart';
import 'textArea.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessageEmail = '';
  String errorMessagePass = '';

  RegExp regexpEmail = new RegExp(
    r"[\w\d]+@\w+\.\w+",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 40),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                TextArea(
                  inputType: TextInputType.emailAddress,
                  icon: Icons.email,
                  controller: emailController,
                  errorMessage: errorMessageEmail,
                  inputHint: 'Enter Your Email',
                ),
                TextArea(
                  inputType: TextInputType.visiblePassword,
                  icon: Icons.password,
                  controller: passwordController,
                  errorMessage: errorMessagePass,
                  inputHint: 'Enter Your Password',
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      if (errorMessageEmail.isNotEmpty) errorMessageEmail = '';
                      if (errorMessagePass.isNotEmpty) errorMessagePass = '';
                      setState(
                        () {
                          if (emailController.text.isEmpty) {
                            errorMessageEmail = 'This Can not be empty';
                          } else if (!regexpEmail
                              .hasMatch(emailController.text)) {
                            errorMessageEmail = 'Invalid Email!';
                          }
                          if (passwordController.text.isEmpty) {
                            errorMessagePass = 'This Can not be empty';
                          } else if (passwordController.text.length < 8) {
                            errorMessagePass = 'Too short!';
                          }
                        },
                      );
                    },
                    child: const Text('Login'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
