import 'package:weather_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/london.png',
            ),
            fit:BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ) ,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color:Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value){
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: (){
                  //navigator co 2 tham so 1 la context 2 la tham so ta muon dua vao
                  //navigator.push co 1 output tuy chon o duoi dang Future
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
