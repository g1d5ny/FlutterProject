// ===== override =====


void main() {
  TimesTwo tt = TimesTwo(2);
  print(tt.calculate());

  TimesFour tf = TimesFour(2);
  print(tf.calculate());
}

// method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시하다)
class TimesTwo {
  final int number;

  TimesTwo(
      this.number,
      );

  // method
  int calculate() {
    return number * 2;
  }
}

class TimesFour extends TimesTwo {
  TimesFour(
      int number,
      ) : super(number);

  @override // override 생략해도 부모 클래스에서 상속해서 쓸 수 있지만 override를 쓰는게 좀 더 직관적이어서 쓰는게 좋음
  int calculate(){
    return super.number*4;  // super.number로 쓰는게 정석이나, 그냥 number로 써도 무방
  }

  int calculate2() {
    return super.calculate()*2;
  }
}
