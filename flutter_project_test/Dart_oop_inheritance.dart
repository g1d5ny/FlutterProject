// ===== 상속 - inheritance =====
void main() {
  Idol apink = Idol(name: '에이핑크', membersCount: 5);
  apink.sayName();
  apink.sayMembersCount();

  BoyGroup bts = BoyGroup('BTS', 7);
  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();
}

// 상속 - inheritance
// 상속으르 받으면 부모 클래스의 모든 속성과 기능을 자식 클래스가 부여 받는다.
class Idol {
  String name;
  int membersCount;

  Idol({
    required this.name,
    required this.membersCount,
  });

  void sayName() {
    print("저는 ${this.name} 입니다.");
  }

  void sayMembersCount() {
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }
}

class BoyGroup extends Idol {
  BoyGroup(String name, int membersCount)
      : super(
    name: name,
    membersCount: membersCount,
  );

  void sayMale() {
    print('저는 남자 아이돌 입니다.');
  }
}
