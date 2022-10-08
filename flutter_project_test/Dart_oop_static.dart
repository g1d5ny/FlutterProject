// ===== static =====

void main() {
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');

  Employee.building = '오투타워';
  // seulgi, chorong 둘다 다른 instance이지만
  // static이 class에 귀속되기 때문에 모든 instanc에 같은 building명이 들어감.
  seulgi.printNameAndBuilding();
  chorong.printNameAndBuilding();

  seulgi.printBuilding(); // error (static은 instance에 귀속 될 수 없음)
  Employee.printBuilding();
}

class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 알바생이 일하고 있는 건물
  static String? building;
  // 알바생 이름
  final String name;

  Employee(this.name);

  void printNameAndBuilding() {
    print('제 이름은 $name입니다. $building 건물에서 근무하고 있습니다.');
  }

  static void printBuilding() {
    print('저는 $building 건물에서 근무중입니다.');
  }
}
