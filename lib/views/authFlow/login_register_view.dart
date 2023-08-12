import 'package:fanastic_assistant/logic/snackbar/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../logic/auth/auth.dart';
import '../../utils/const_values.dart';
import '../../widgets/entry_field.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({super.key});

  @override
  State<LoginRegisterView> createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends State<LoginRegisterView> {
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
      ShowSnackBar().showSnackBar(e.message.toString(), context);
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      ShowSnackBar().showSnackBar(e.message.toString(), context);
    }
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
              EntryField(title: 'email', controller: _emailController),
              EntryField(title: 'password', controller: _passwordController),
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
