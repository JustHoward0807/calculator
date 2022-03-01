  // void displayNum(String num) {
  //   if (_outputNumber == "0") {
  //     _outputNumber = "";
  //     // _calculation = "";
  //     _outputNumber += num;
  //     // _calculation += num;
  //   } else {
  //     _outputNumber += num;
  //     // _calculation += num;
  //   }

  //   notifyListeners();
  // }

  // void operatorNum(String operator) {
  //   if (!_outputNumber.contains(operator) && operator != '=') {
  //     _outputNumber += operator;

  //     // _calculation += operator;

  //   }
  //   if (operator == '=') {
  //     if (_outputNumber.contains('+')) {
  //       List splitList;

  //       splitList = _outputNumber.split('+');
  //       int plus;
  //       plus = int.parse(splitList[0]) + int.parse(splitList[1]);
  //       _outputNumber = plus.toString();
  //     } else if (_outputNumber.contains('-')) {
  //       List splitList;

  //       splitList = _outputNumber.split('-');
  //       int minus;
  //       minus = int.parse(splitList[0]) - int.parse(splitList[1]);
  //       _outputNumber = minus.toString();
  //     }
  //   }
  //   notifyListeners();
  // }

  /*
  void displayNum(String num) {
    
    if (_outputNumber == "0" && num == '+') {
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
      
    } 
    else if (preNumber.contains('+')) {
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
      }else{
        _outputNumber = _outputNumber.replaceAll('-', '');
      }
      
    }

    // ignore: avoid_print
    print('preNum: $preNumber');
    // ignore: avoid_print
    print('afterNum: $afterNumber');
    notifyListeners();
  }

  void operatorNum(String operator) {
    
    
    if (operator == '=') {
      if (preNumber.contains('+')) {
        preNumber = preNumber.replaceAll('+', '');
        _outputNumber =
            (int.parse(preNumber) + int.parse(afterNumber)).toString();
      }else{
        preNumber = preNumber.replaceAll('-', '');
        _outputNumber =
            (int.parse(preNumber) - int.parse(afterNumber)).toString();
      }
      
    }
    notifyListeners();
  }
  
  
  */ 