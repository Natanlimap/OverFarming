import 'package:farmclick/Pages/mainpage.dart';
import 'package:farmclick/Utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/background.jpg"),
        fit: BoxFit.cover,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("OVER", style: _titleStyle),
          Text("FARMING", style: _titleStyle),
          SizedBox(
            width: 222,
            height: 65,
            child: new OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
                print("oi");
              },
              child: Text("Jogar",
                  style: TextStyle(
                      color: DARK_GREEN,
                      fontWeight: FontWeight.bold,
                      fontSize: 36)),
            ),
          )
        ],
      ),
    ));
  }
}

TextStyle _titleStyle =
    TextStyle(fontSize: 86, fontWeight: FontWeight.bold, color: DARK_GREEN);
