import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/signInScreen.dart';

import 'welcomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SignUpApp());
}

class SignUpApp extends StatefulWidget {
  @override
  _SignUpAppState createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> {
// Set default `_initialized` and `_error` state to false
  bool initialized = false;
  bool error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        initialized = true;
        print("true");
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        error = true;
        print(e);
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    print("initiating");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignInScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}
