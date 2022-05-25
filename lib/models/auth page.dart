import 'package:flutter/material.dart';
import 'package:siri/screens/login%20screen.dart';

import '../screens/register.dart';

class AuthPage extends StatefulWidget{
  const AuthPage ({Key? key }) : super (key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool showLoginPage = true ;

  void togglescreen () {
    setState((){
      showLoginPage = !showLoginPage;
    });

  }
  @override
  Widget build (BuildContext context){
    if (showLoginPage){
      return LoginPage(showRegisterPage: togglescreen );
    }
    else {
      return RegisterPage(showLoginPage: togglescreen);
    }
  }
}