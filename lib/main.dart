//Haven't implement the double number function

import 'package:calculator/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final numberProvider = ChangeNotifierProvider<NumberCalNotifier>((ref) {
  return NumberCalNotifier();
});

class NumberCalNotifier extends ChangeNotifier {
  String _outputNumber = "0";
  String preNumber = "";
  String afterNumber = "";
  get outputNumber => _outputNumber;

  void displayNum(String num) {
    if (_outputNumber != '0' &&
        !preNumber.contains('+') &&
        !preNumber.contains('-')) {
      //If the output number != 0 then make the current preNumber = outputnumber so the number could continue be used.
      preNumber = _outputNumber;
    }
    if (_outputNumber == "0" && num == '+') {
      //If the initial number is 0 and the input is +, then make the prenumber to be 0+ so 0+ would be default prenumber
      if (num == '+') {
        preNumber = '0+';
        _outputNumber = preNumber;
        _outputNumber = _outputNumber.replaceAll('+', '');
      }
    } else if (_outputNumber == "0" && num == '-') {
      if (num == '-') {
        preNumber = '0-';
        _outputNumber = preNumber;
        _outputNumber = _outputNumber.replaceAll('-', '');
      }
    } else if (preNumber.contains('+')) {
      //if the prenumber contains + or - then the number after that would be afternumber
      afterNumber += num;
      _outputNumber = afterNumber;
    } else if (preNumber.contains('-')) {
      afterNumber += num;
      _outputNumber = afterNumber;
    } else {
      preNumber += num;
      _outputNumber = preNumber;
      if (_outputNumber.contains('+')) {
        _outputNumber = _outputNumber.replaceAll('+', '');
      } else if (_outputNumber.contains('-')) {
        _outputNumber = _outputNumber.replaceAll('-', '');
      }
    }

    notifyListeners();
  }

  void operatorNum(String operator) {
    if (operator == '=') {
      if (preNumber.contains('+')) {
        preNumber = preNumber.replaceAll('+', '');
        _outputNumber =
            (int.parse(preNumber) + int.parse(afterNumber)).toString();
        afterNumber = '';
      } else if (preNumber.contains('-')) {
        preNumber = preNumber.replaceAll('-', '');
        _outputNumber =
            (int.parse(preNumber) - int.parse(afterNumber)).toString();
        afterNumber = '';
      }
    }
    notifyListeners();
  }

  void clearNum() {
    _outputNumber = '0';
    preNumber = '';
    afterNumber = '';
    notifyListeners();
  }
}

final List<String> arrangedList = [
  'AC',
  '+/-',
  '%',
  '/',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '.',
  '=',
];

final List colorList = [
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.orange,
  Colors.grey[900],
  Colors.grey[900],
  Colors.grey[900],
  Colors.orange,
  Colors.grey[900],
  Colors.grey[900],
  Colors.grey[900],
  Colors.orange,
  Colors.grey[900],
  Colors.grey[900],
  Colors.grey[900],
  Colors.orange,
  Colors.grey[900],
  Colors.grey[900],
  Colors.orange
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(bodyText2: whiteTextColor),
      ),
      home: const CalHomePage(),
    );
  }
}

class CalHomePage extends ConsumerWidget {
  const CalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberCalNotifier = ref.watch(numberProvider);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  bottom: 10,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    numberCalNotifier._outputNumber,
                    style: const TextStyle(fontSize: 60),
                  ),
                ),
              ),
            ),
            const Expanded(flex: 3, child: BtnWidget()),
          ],
        ));
  }
}

class BtnWidget extends ConsumerWidget {
  const BtnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberCalNotifier = ref.watch(numberProvider);
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: 70, mainAxisSpacing: 10),
        itemCount: arrangedList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (arrangedList[index] == '0' ||
                  arrangedList[index] == '1' ||
                  arrangedList[index] == '2' ||
                  arrangedList[index] == '3' ||
                  arrangedList[index] == '4' ||
                  arrangedList[index] == '5' ||
                  arrangedList[index] == '6' ||
                  arrangedList[index] == '7' ||
                  arrangedList[index] == '8' ||
                  arrangedList[index] == '9' ||
                  arrangedList[index] == '.' ||
                  arrangedList[index] == '+' ||
                  arrangedList[index] == '-') {
                numberCalNotifier.displayNum(arrangedList[index]);
              } else if (arrangedList[index] == 'AC') {
                numberCalNotifier.clearNum();
              } else if (arrangedList[index] == '+' ||
                  arrangedList[index] == '=' ||
                  arrangedList[index] == '-') {
                numberCalNotifier.operatorNum(arrangedList[index]);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: colorList[index],
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(arrangedList[index])),
            ),
          );
        });
  }
}
