import 'package:fanastic_assistant/auth.dart';
import 'package:fanastic_assistant/views/homepage_view.dart';
import 'package:fanastic_assistant/views/login_register_view.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStatechanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomepageView();
        } else {
          return const LoginRegisterView();
        }
      },
    );
  }
}
