// ===== constructor, immutable, getter/setter, private =====

void main() {
  // constructor에 const가 있어도 함수 선언 앞에는 const 붙여도 되고 안 붙여도 됨
  Idol blackPink = Idol('블랙핑크', ['지수', '로제', '리사', '제니']);
  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();
  print(blackPink.firstMember);
  blackPink.firstMember = '코드팩토리';
  print(blackPink.firstMember); // 지수 -> 코드팩토리

  Idol blackPink1 = const Idol('블랙핑크', ['지수', '로제', '리사', '제니']);
  Idol blackPink2 = const Idol('블랙핑크', ['지수', '로제', '리사', '제니']);
  Idol blackPink3 = Idol('블랙핑크', ['지수', '로제', '리사', '제니']);
  Idol blackPink4 = Idol('블랙핑크', ['지수', '로제', '리사', '제니']);

  print(blackPink1 == blackPink2); // true => const로 선언하면 같은 인스턴스 됨
  print(blackPink1 == blackPink3);  // false
  print(blackPink3 == blackPink4);  // false

  Idol bts = Idol.fromList([
    ['RM', '진', '슈가', '제이홉', '지민', '뷔', '정국'],
    'BTS'
  ]);

  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
  print(bts.firstMember);
}

// immutable 프로그래밍 - 한번 값을 선언하고 나면 변경할 수 없도록 함
// 1. 변수에 final 키워드 넣음
// 2. constructor 앞에 const 붙임 (빌드타임을 알 수 있는 것만 붙임)

// getter - 데이터를 가져올 때 / setter - 데이터를 설정할 때

// private 값 : 파일 외부에서 사용할 수 없는 값
// 클래스명 or 함수명 or 변수명 앞에 _ 를 붙여주어야 함
class Idol {
  final String name;
  final List<String> members;

  // constructor
  const Idol(this.name, this.members);

  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print("안녕하세요 ${this.name} 입니다.");
  }

  void introduce() {
    print("저희 멤버는 ${this.members}가 있습니다.");
  }

  // getter
  String get firstMember {
    return this.members[0];
  }

  // setter : 파라미터 하나만 들어갈 수 있음
  set firstMember(String name) {
    // List 특징 : List는 final이어도 members 원소를 바꿀 수 있음
    this.members[0] = name;
  }

  set firstMember2(List<String> members) {
    // List 특징 : List는 final이면 새 리스트로 바꿀 수 없음
    // this.members = members; // error
  }
}
