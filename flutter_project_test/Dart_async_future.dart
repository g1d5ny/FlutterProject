void main() async {
  // 비동기 처리

  addNumbers(1, 1);
  // 계산 시작 : 1 + 1
  // 함수 완료
  // 계산 완료: 1 + 1 = 2

  asyncAddNumbers(1, 1);
  asyncAddNumbers(2, 2);
  // 계산 시작 : 1 + 1
  // 계산 시작 : 2 + 2
  // 계산 완료: 1 + 1 = 2
  // 함수 완료
  // 계산 완료: 2 + 2 = 4
  // 함수 완료

  await futureAddNumbers(1, 1);
  await futureAddNumbers(2, 2);
  // 계산 시작 : 1 + 1
  // 계산 완료: 1 + 1 = 2
  // 함수 완료
  // 계산 시작 : 2 + 2
  // 계산 완료: 2 + 2 = 4
  // 함수 완료

  await futureAddNumbers2(1, 1);
  await futureAddNumbers2(2, 2);
  // 계산 시작 : 1 + 1
  // 계산 완료: 1 + 1 = 2
  // 함수 완료
  // 계산 시작 : 2 + 2
  // 계산 완료: 2 + 2 = 4
  // 함수 완료
}

void addNumbers(int number1, int number2) {
  print('계산 시작 : $number1 + $number2');

  // 서버 시뮬레이션
  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료');
}

void asyncAddNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');

  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료');
}

Future<void> futureAddNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');

  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });
  print('함수 완료');
}

Future<int> futureAddNumbers2(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');

  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료');

  return number1 + number2;
}