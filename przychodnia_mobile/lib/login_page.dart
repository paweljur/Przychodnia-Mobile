import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final String correctUsername = 'Doctor';
  final String correctPassword = 'Qwerty1234!';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (usernameController.text == correctUsername &&
        passwordController.text == correctPassword) {
      Navigator.pushReplacementNamed(context, '/appointments');
    } else {
      usernameController.clear();
      passwordController.clear();
      
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Invalid username or password'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Username'),
                    controller: usernameController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                Center(
                  child: FlatButton(
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      login();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
