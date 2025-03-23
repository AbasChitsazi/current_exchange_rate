import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      supportedLocales: [
        Locale('fa', 'IR'), // iran
      ],
      theme: ThemeData(fontFamily: 'Dana'),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 27, 0),
            child: Image.asset('assets/images/cash-icon.png'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: const Text(
              'قیمت بروز سکه و ارز',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/images/burger-menu.png'),
            ),
          ),
          const SizedBox(width: 27.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/info.png'),
                SizedBox(width: 10),
                const Text('نرخ ارز آزاد چیست ؟'),
              ],
            ),
            const Text(
              ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
              style: TextStyle(color: Color.fromARGB(255, 30, 30, 30)),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
