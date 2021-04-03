import 'package:flutter/material.dart';
import 'package:estudoflutter/constants/app_constants.dart';
import 'package:estudoflutter/widgets/left_bar.dart';
import 'package:estudoflutter/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  double _imcResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 130,
                    child: TextField(
                        controller: _alturaController,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Altura",
                            hintStyle: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8))))),
                Container(
                    width: 130,
                    child: TextField(
                      controller: _pesoController,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Peso",
                            hintStyle: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8)))))
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _altura = double.parse(_alturaController.text);
                double _peso = double.parse(_pesoController.text);

                setState(() {
                  _imcResult = _peso / (_altura * _altura);
                  if(_imcResult < 18.5){
                    _textResult = "Você está acima do peso";
                  }else if(_imcResult >= 18.5 && _imcResult <= 25){
                    _textResult = "Você tem o peso normal";
                  }else if(_imcResult >= 24.9 && _imcResult <=30){
                    _textResult = "Você está sobrepeso";
                  }else{
                    _textResult = "Você está peso obesidade";
                  }
                });
              },
              child: Text("Calcular", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: accentHexColor)),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(_imcResult.toStringAsFixed(2) + " Kg/m²", style: TextStyle(fontSize: 50, color: accentHexColor),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child:
              Container(
                child: Text(_textResult, style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: accentHexColor),),
              )
            ),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40,),

            SizedBox(height: 20,),
            RightBar(barWidth: 70,),
            SizedBox(height: 50,),
            RightBar(barWidth: 70,),
          ],
        ),
      ),
    );
  }
}
