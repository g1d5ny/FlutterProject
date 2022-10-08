void main() {
  // dynamic (var과 비슷하지만 타입이 다른 변수로 재 선언 가능)
  dynamic name = '코드팩토리';
  name = 2;

  var name1 = '코드팩토리';
  name1 = 2;  // error

  // nullable - null이 될 수 있다.
  // non-nullable - null이 될 수 없다.
  // null - 아무런 값도 있지 않다.
  String name2 = '코드팩토리';  // name2 타입 : only string
  String? name3 = '블랙핑크'; // name3 타입 : string | null
  name3 = null;
  // ! : null이 들어갈 수 있는 타입에 !를 붙이면 현재 이 값은 null이 아니다.
  print(name3!);  // TypeError

  // final, const : 변수 한번 선언하면 바꿀 수 없다, 타입 생략 가능
  final name4 = '코드팩토리';
  name4 = '블랙핑크';  // error
  const name5 = '블랙핑크';
  name5 = name4; // error

  // DateTime.now() : 런 버튼을 누른 후에 실행되는 코드 (=> 빌드 타임 알 수 없음)
  // final : 빌드 타임 알고 있지 않아도 됨
  final DateTime now = DateTime.now();

  // const : 빌드 타임 알아야 됨
  const DateTime now2 = DateTime.now(); // error

  // ??= operator
  double? number = 4.0;
  number = null;
  number ??= 3.0; // number가 null이면 3.0으로 바꿔라

  // 타입 비교 operator
  int number2 = 1;
  print(number2 is int);  // true
  print(number2 is String);  // false
  print(number2 is! int);  // false
  print(number2 is! String); // true

  // Map
  Map<String, bool> isHarryPotter = {
    'Harry Potter': true,
    'Ron Weasley': true,
    'Ironman': false
  };

  // Map 원소 추가
  isHarryPotter.addAll({'Spiderman': false});
  isHarryPotter['Hulk'] = false;
  print(isHarryPotter); // {Harry Potter: true, Ron Weasley: true, Ironman: false, Spiderman: false, Hulk: false}

  // Map 원소 변경
  isHarryPotter['Spiderman'] = true;
  print(isHarryPotter['Spiderman']);  // true

  // Map 원소 삭제
  isHarryPotter.remove('Harry Potter');
  print(isHarryPotter['Harry Potter']); // null

  // Map key, value 출력
  print(isHarryPotter.keys);  // (Ron Weasley, Ironman, Spiderman, Hulk)
  print(isHarryPotter.values);  // (true, false, true, false)

  // Set (List와 비슷하지만 List는 중복 값이 들어갈 수 있고, Set은 중복을 자동으로 처리해주기 때문에 중복 값이 들어갈 수 없음)
  Set<String> names = {
    'Code Factory', 'Flutter', 'Black Pink', 'Flutter'
  };

  print(names); // {Code Factory, Flutter, Black Pink}

  // for loop
  int total = 0;
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  for (int number in numbers) {
    total += number;
  }

  print(total); // 21

  for (int i = 0; i < 10; i++) {
    if (i == 5) continue;
    print(i); // 0, 1, 2, 3, 4, 6, 7, 8, 9
  }

  // positional parameter - 순서가 중요한 파라미터
  addNumbers(int x, int y, int z) {
    print(x+y+z);
  }

  addNumbers(1, 2, 3); // 6

  // optional parameter - 있어도 되고 없어도 되는 파라미터
  addNumbers2(int x, [int y = 2, int z = 3]) {
    print(x+y+z);
  }

  addNumbers2(1);  // 6

  // named parameter - 이름이 있는 파라미터 (순서 중요 X)
  addNumbers3({required int x, required int y, required int z}) {
    print(x+y+z);
  }

  addNumbers3(y: 2, z: 3, x: 1);  // 6

  addNumbers4({required int x, required int y, int z = 3}) {
    print(x+y+z);
  }

  addNumbers4(y: 2, x: 1);  // 6

  // positional parameter와 named parameter 혼용
  addNumbers5(int x, {required int y, int z = 3}) {
    print(x+y+z);
  }

  addNumbers5(1, y: 2);   // 6

  // arrow function - 화살표 함수
  int addNumbers6 (int x, {required int y, int z = 3}) => x+y+z;
  int result = addNumbers6(1, y: 2);
  print(result);  // 6

  int add(int x, int y, int z) => x+y+z;
  print(add(1, 2, 3));  // 6

  int subtract(int x, int y, int z) => x-y-z;
  print(subtract(1, 2, 3)); // -4

  int calculate(int x, int y, int z, Operation operation) {
    return operation(x, y, z);
  }
  print(calculate(1, 2, 3, add));  // 6

}
// typedef signature
typedef Operation = int Function(int x, int y, int z);  // return type과 parameter type 일치해야함
