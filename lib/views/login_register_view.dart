import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
import '../utils/const_values.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({super.key});

  @override
  State<LoginRegisterView> createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends State<LoginRegisterView> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Padding(
        padding: standardPadding(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _entryField('email', _emailController),
              _entryField('password', _passwordController),
              _errorMessage(),
              ElevatedButton(
                onPressed: isLogin
                    ? signInWithEmailAndPassword
                    : createUserWithEmailAndPassword,
                child: Text(
                  isLogin ? 'login' : 'register',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      isLogin = !isLogin;
                    },
                  );
                },
                child: Text(
                  isLogin ? 'Register instead' : 'Login instead',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
