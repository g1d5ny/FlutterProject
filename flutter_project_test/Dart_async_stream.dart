import 'dart:async';  // dart:async에서 Stream 패키지 제공함

void main() {
  // stream
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.where((val) => val%2 == 0).listen((val) {
    print('Listener 1 : $val');
  });

  final streamListener2 = stream.where((val) => val%2 == 1).listen((val) {
    print('Listener 2 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);

  // Listener 2 : 1
  // Listener 1 : 2
  // Listener 2 : 3
  // Listener 1 : 4
  // Listener 2 : 5


  calculate(2).listen((val) {
    print('calculate(2): $val');
  });

  calculate(4).listen((val) {
    print('calculate(4): $val');
  });

  // calculate(2): 0
  // calculate(4): 0
  // 1초 뒤
  // calculate(2): 2
  // calculate(4): 4
  // 1초 뒤
  // calculate(2): 4
  // calculate(4): 8
  // 1초 뒤
  // calculate(2): 6
  // calculate(4): 12
  // 1초 뒤
  // calculate(2): 8
  // calculate(4): 16

  playAllStream().listen((val){
    print(val);
  });
  // 모든 출력 1초 뒤에 나옴 (calculate(1) 후에 calculate(1000)이 실행됨)
  // 0
  // 1
  // 2
  // 3
  // 4
  // 0
  // 1000
  // 2000
  // 3000
  // 4000

}

Stream<int> calculate(int number) async* {
  for(int i = 0; i < 5; i++) {
    yield i*number; // Stream에서 return 역할

    await Future.delayed(Duration(seconds: 1));
  }
}

Stream<int> playAllStream() async* {
  yield* calculate(1);  // yield*: async*에서의 await 역할
  yield* calculate(1000); // yield*: async*에서의 await 역할
}
