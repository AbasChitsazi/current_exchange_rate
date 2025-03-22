import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/images/burger-menu.png"),
                ),
              ),
              Text("قیمت به روز ارز"),
              Image.asset("assets/images/cash-icon.png"),
            ],
          ),
        ),
        body: Center(child: Text("Home Page")),
      ),
    );
  }
}
