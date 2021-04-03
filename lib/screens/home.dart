import 'package:flutter/material.dart';
import 'package:estudoflutter/constants/app_constants.dart';
import 'package:estudoflutter/widgets/left_bar.dart';
import 'package:estudoflutter/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora IMC",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}