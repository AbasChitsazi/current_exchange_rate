// main() async {
//   final Stream<String> listening = wakitaki();
//   listening.listen((event) => print(event));
// }

// Stream<String> wakitaki() async* {
//   int count = 1;
//   while (true) {
//     yield "${count++} hi abbas";

//   }
// }
// import 'dart:async';

// void main() {
//   // ساخت یک Stream که به تدریج اعداد را ارسال می‌کند
//   Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 1), (count) => count + 1).take(5);

//   // گوش دادن به این Stream و دریافت داده‌ها
//   numberStream.listen((number) {
//     print(number);  // هر عدد جدید که از Stream میاد چاپ می‌کنیم
//   });
// }
// import 'dart:async';

// Stream<String> getMessagesFromServer() async* {
//   await Future.delayed(Duration(seconds: 1)); // تأخیر برای شبیه‌سازی ارسال داده
//   yield 'سلام!'; // اولین پیام
//   await Future.delayed(Duration(seconds: 1)); 
//   yield 'چطور هستی؟'; // پیام بعدی
//   await Future.delayed(Duration(seconds: 1));
//   yield 'خوبی؟'; // پیام بعدی
// }

// void main() {
//   getMessagesFromServer().listen((message) {
//     print('پیام جدید: $message');
//   });
// }

import 'dart:async';

void main() {
  // شبیه‌سازی ورودی کاربر (مثلاً از کیبورد)
  StreamController<String> inputStreamController = StreamController<String>();

  // گوش دادن به ورودی‌های کاربر
  inputStreamController.stream.listen((input) {
    print('ورودی کاربر: $input');
  });

  // ارسال داده به استریم (ورودی‌های کاربر)
  inputStreamController.add('د');
  inputStreamController.add('ا');
  inputStreamController.add('ر');
  inputStreamController.add('ت');
}


// Stream<int> countdown(int start) async* {
//   int count = start;
//   while (count > 0) {
//     yield count;
//     await Future.delayed(Duration(seconds: 1));
//     count--;
//   }
// }

// void main() {
//   countdown(5).listen((timeLeft) {
//     print('زمان باقی‌مانده: $timeLeft');
//   });
// }
