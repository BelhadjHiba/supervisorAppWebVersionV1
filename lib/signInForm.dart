import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'animatedProgressIndicator.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _passwordController = TextEditingController();

  double _formProgress = 0;

  FirebaseAuth auth = FirebaseAuth.instance;
  String email;
  String password;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _emailController,
      _lastNameTextController,
      _passwordController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign In', style: Theme.of(context).textTheme.headline4),
          Divider(
            height: 20,
            indent: 20,
            endIndent: 20,
            thickness: 1,
            color: Colors.grey[100],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 7, 30, 0),
            child: TextFormField(
              onChanged: (value) => email = value,
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 7, 30, 0),
            child: TextFormField(
              onChanged: (value) => password = value,
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blue;
                }),
              ),
              onPressed: () async {
                try {
                  final user = await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    _showWelcomeScreen();
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
