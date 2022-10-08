void main() {
  // Functional Programming
  // 1. 형변환
  List<String> blackPink = ['로제', '지수', '리사', '제니', '제니'];
  print(blackPink); // List ['로제', '지수', '리사', '제니', '제니']
  print(blackPink.asMap()); // List -> Map {0: 로제, 1: 지수, 2: 리사, 3: 제니, 4: 제니}
  print(blackPink.toSet()); // List -> Set {로제, 지수, 리사, 제니}

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys); // (0, 1, 2, 3, 4)
  print(blackPinkMap.keys.toList()); // Map key -> List [0, 1, 2, 3, 4]
  print(blackPinkMap.values); // (로제, 지수, 리사, 제니, 제니)

  Set blackPinkSet = Set.from(blackPink);
  print(blackPinkSet.toList()); // Set -> List [로제, 지수, 리사, 제니]

  // 2. Map iterable
  List<String> blackPink2 = ['로제', '지수', '리사', '제니'];

  // 2-1. List map
  final newBlackPink = blackPink2.map((x) {
    return '블랙핑크 $x';
  });
  print(newBlackPink.toList()); // [블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니]

  // 2-2. String map
  String number = '13579';
  final parsed = number.split('').map((x) => '$x.jpg').toList();
  print(parsed); // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]

  // 2-3. Map map
  Map<String, String> harryPotter = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저'
  };

  final result = harryPotter.map((key, value) => MapEntry('$key', '$value'));

  print(harryPotter); // {Harry Potter: 해리 포터, Ron Weasley: 론 위즐리, Hermione Granger: 헤르미온느 그레인저}
  print(result); // {Harry Potter: 해리 포터, Ron Weasley: 론 위즐리, Hermione Granger: 헤르미온느 그레인저}

  // ⭐️ 2-4. Map keys map
  final keys = harryPotter.keys.map((x) => '$x').toList();
  print(keys); // [Harry Potter, Ron Weasley, Hermione Granger]

  // ⭐️ 2-5. Map values map
  final values = harryPotter.values.map((x) => '$x').toList();
  print(values); // [해리 포터, 론 위즐리, 헤르미온느 그레인저]

  // 3. Set iterable
  // 3-1. Set map
  Set blackPinkSet2 = {'로제', '지수', '제니', '리사', '리사'};

  final newSet = blackPinkSet2.map((x) => '$x').toSet();
  print(blackPinkSet2); // {로제, 지수, 제니, 리사}
  print(newSet); // {로제, 지수, 제니, 리사}

  // ⭐️ 4. where (find 느낌)
  List<Map<String, String>> people = [
    {'name': '로제', 'group': '블랙핑크'},
    {'name': '지수', 'group': '블랙핑크'},
    {'name': 'RM', 'group': 'BTS'},
    {'name': '뷔', 'group': 'BTS'},
  ];

  final blackPink3 = people.where((x) => x['group'] == '블랙핑크').toList();
  final bts = people.where((x) => x['group'] == 'BTS').toList();

  print(blackPink3); // [{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}]
  print(bts); // [{name: RM, group: BTS}, {name: 뷔, group: BTS}]

  // 5. reduce
  // 5-1. numbers
  List<int> numbers = [1, 3, 5, 7, 9];

  final result2 = numbers.reduce((prev, next) => prev + next);
  // prev: 1, next: 3 / prev += next = 4
  // prev: 4, next = 5 / prev += next = 9
  // prev: 9, next = 7 / prev += next = 16
  // prev: 16, next: 9 / prev += next = 25

  print(result2); // 25

  // 5-2. string
  List<String> words = ['안녕하세요 ', '저는 ', '코드팩토리 입니다.'];

  final sentence = words.reduce((prev, next) => prev + next);
  // prev: '안녕하세요 ', next: '저는 ' / prev += next = '안녕하세요 저는 '
  // prev: '안녕하세요 저는 ', next: '코드팩토리 입니다.' / prev += next = '안녕하세요 저는 코드팩토리 입니다.'

  print(sentence); // 안녕하세요 저는 코드팩토리 입니다.

  // error (⭐️ reduce를 실행하는 List 멤버들과 같은 type을 return해야 실행 가능)
  words.reduce((prev, next) => prev.length + next.length);

  // 6. fold
  // reduce의 단점(reduce를 실행하는 List 멤버들과 같은 type을 return해야 실행 가능)을 보완하여 나온 함수
  List<int> numbers2 = [1, 3, 5, 7, 9];

  final sum = numbers2.fold<int>(10, (prev, next) => prev + next);
  print(sum); // 35

  List<String> words2 = ['안녕하세요 ', '저는 ', '코드팩토리 입니다.'];
  final sentence2 = words2.fold<String>('메롱 ', (prev, next) => prev + next);
  print(sentence2); // 메롱 안녕하세요 저는 코드팩토리 입니다.

  final count = words2.fold<int>(10, (prev, next) => prev + next.length);
  // prev: 10, next: 안녕하세요 / prev += next.length = 16
  // prev: 16, next: 저는 / prev += next.length = 19
  // prev: 19, next: 코드팩토리 입니다. / prev += next.length = 29

  print(count); // 29

  // 7. cascade
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];

  print([...even, ...odd]); // [2, 4, 6, 8, 1, 3, 5, 7]
  print(even); // [2, 4, 6, 8]
  print([...even]); // [2, 4, 6, 8]
  print(even == [...even]); // false ([...even]라는 새로운 배열을 생성했기 때문)

  // 8. 실전
  // 8-1.
  final parsedPeople = people
      .map((x) => Person(
      name: x['name']!,
      group: x['group']!)) // ! : []안의 key가 List에 무조건 있다는 표시
      .toList();
  print(parsedPeople); // [name: 로제, group: 블랙핑크, name: 지수, group: 블랙핑크, name: RM, group: BTS, name: 뷔, group: BTS]

  final bts2 = parsedPeople.where((x) => x.group == 'BTS');
  print(bts2); // (name: RM, group: BTS, name: 뷔, group: BTS)

  // 8-2.
  final bts3 = people
      .map((x) => Person(name: x['name']!, group: x['group']!))
      .toList() // [name: 로제, group: 블랙핑크, name: 지수, group: 블랙핑크, name: RM, group: BTS, name: 뷔, group: BTS]
      .where((x) => x.group == 'BTS') // (name: RM, group: BTS, name: 뷔, group: BTS)
      .fold<int>(0, (prev, next) => prev + next.name.length);  // 3 (RM + 뷔)
}

class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group,
  });

  @override
  String toString() {
    return 'name: $name, group: $group';
  }
}
