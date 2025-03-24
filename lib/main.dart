// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mycli/Model/Currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Language :  fa // CountryCode: IR
      supportedLocales: [Locale('fa', 'IR')],
      // set FontFamily With Theme Data
      theme: ThemeData(
        fontFamily: 'Dana',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Dana',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Dana',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.green,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // Pass Scaffold to a new Class
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> currency = [];

  Future getResponse() async {
    String url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";
    var value = await http.get(Uri.parse(url));
    if (currency.isEmpty) {
      if (value.statusCode == 200) {
        List jsonList = convert.jsonDecode(value.body);
        if (jsonList.isNotEmpty) {
          for (var i = 0; i < jsonList.length; i++) {
            setState(() {
              currency.add(
                Currency(
                  id: jsonList[i]["id"],
                  title: jsonList[i]["title"],
                  price: jsonList[i]["price"],
                  changes: jsonList[i]["changes"],
                  status: jsonList[i]["status"],
                ),
              );
            });
          }
        }
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    getResponse();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        // elevation: 0, shadows off
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 18, 0),
            child: Image.asset('assets/images/cash-icon.png'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'قیمت بروز سکه و ارز',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/burger-menu.png'),
            ),
          ),
          const SizedBox(width: 18.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // info and text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/info.png'),
                  SizedBox(width: 10),
                  Text(
                    'نرخ ارز آزاد چیست ؟',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              // text نرخ ارز آزاد ....
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Text(
                  'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textDirection: TextDirection.rtl,
                ),
              ),
              // titles of container
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 130, 130, 130),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "نام آزاد ارز",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "قیمت",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "تغییر",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              // value of items
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: currency.length,
                    // Myitems
                    itemBuilder: (BuildContext context, int position) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: myItem(position, currency),
                      );
                    },
                    // Ads items
                    separatorBuilder: (BuildContext context, int index) {
                      if (index % 9 == 0) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: addsItem(),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              // button update
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 232, 232),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // update btn
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          onPressed:
                              () => _showSnackBar(
                                context,
                                "بروزرسانی با موفقیت انجام شد",
                              ),
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "بروزرسانی",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Icon(
                              CupertinoIcons.refresh_bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Color.fromARGB(255, 202, 193, 255),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text("آخرین بروزرسانی ${_getTime()}"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTime() {
    return "20:45";
  }
}

// ignore: camel_case_types
class myItem extends StatelessWidget {
  int position;
  List<Currency> currency;

  myItem(this.position, this.currency, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            currency[position].title!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            currency[position].price!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            currency[position].changes!,
            style:
                currency[position].status == "p"
                    ? Theme.of(context).textTheme.labelSmall
                    : Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class addsItem extends StatelessWidget {
  const addsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("تبلیغات", style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg, style: Theme.of(context).textTheme.headlineMedium),
      backgroundColor: Colors.green[800],
    ),
  );
}
