import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clone/models/variables.dart';
import 'package:tik_tok_clone/pages/pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  registerUser() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedUser) {
      userCollection.doc(signedUser.user.uid).set({
        'username': usernameController.text,
        'password': passwordController.text,
        'email': emailController.text,
        'uid': signedUser.user.uid,
        'profilepic':
            'https://media-exp1.licdn.com/dms/image/C4D03AQGf401qFr-mKA/profile-displayphoto-shrink_200_200/0?e=1602720000&v=beta&t=VUIqS71Qen3UQf64ddCYMq4A4YOkEt21MnTTPaASKP4'
      });
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Tik Tok',
                style: myStyle(25, Colors.black, FontWeight.w600)),
            SizedBox(height: 10),
            Text('Create An Acount',
                style: myStyle(25, Colors.black, FontWeight.w600)),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    labelStyle: myStyle(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  labelStyle: myStyle(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: myStyle(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => registerUser(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: myStyle(20, Colors.white, FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: myStyle(20),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  child: Text(
                    'Signin',
                    style: myStyle(20, Colors.purple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
