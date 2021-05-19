import 'package:flutter/material.dart';

import 'signInForm.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blueAccent,
          //     Colors.purpleAccent,
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   transform: GradientRotation(3 * pi / 4),
          // ),
          color: Color(0xEFEDFC),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/brain.png",
                width: 250,
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your ",
                    style: TextStyle(
                      fontSize: 30,
                      // color: Colors.black,
                      color: Color(0xCC1464).withOpacity(.8),
                    ),
                  ),
                  Text(
                    "MIND",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xCC1464).withOpacity(1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 600,
                child: Card(
                  color: Colors.white,
                  // color: Color(0x05299E).withOpacity(0.2),
                  child: SignInForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
