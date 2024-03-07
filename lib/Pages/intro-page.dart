import 'package:assignment_1/Pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({ Key? key }) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    _login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Spacer(),
              Container(              
                child: Icon(FontAwesomeIcons.facebook, 
                //color: Colors.blueAccent[700],
                size: 60,),              
              ),
              Spacer(),
              Text("from", style: TextStyle(color: Colors.blueAccent[700]),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(CupertinoIcons.loop_thick, color:  Colors.white,),
                Text("Meta", style:  TextStyle(color: Colors.white),)
              ] ) 
          ],),
        ),
      ) 
      );
  }


Future _login() async {
  await Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MainPage();
            }
        )
        );
        });
        
      }

  }