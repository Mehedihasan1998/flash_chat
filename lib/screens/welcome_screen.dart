import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/register_screen.dart';
import 'package:flash_chat/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id= "welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  // We used SingleTickerProviderStateMixin for one animation
  // We would need to use TickerProviderStateMixin for multiple animations

  AnimationController ?controller;
  Animation ?animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1),vsync: this);

    animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller!);

    controller!.forward();

    controller!.addListener(() {
      setState(() {

      });
      print(animation!.value);
    });

  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [FlickerAnimatedText('Flash Chat')],
                    repeatForever: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButton(
                color: Colors.lightBlueAccent,
                title: "Log In",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }
            ),
            MyButton(
                color: Colors.blueAccent,
                title: "Registration",
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }
            ),

          ],
        ),
      ),
    );
  }
}
