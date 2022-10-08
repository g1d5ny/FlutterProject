import 'package:flutter/material.dart';

// widget class 만들기 단축어 : stless
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Row(
              // MainAxisAlignment - 주축 정렬
              // start - 시작
              // end - 끝
              // center - 가운데
              // spaceBetween - 위젯과 위젯의 사이가 동일하게 배치
              // spaceEvenly - 위젯과 양 끝에 같은 가격으로 배치
              // spaceAround - spaceEvenly + 양 끝의 간격은 위젯 사이 간격의 1/2
              mainAxisAlignment: MainAxisAlignment.start,
              // CrossAxisAlignment - 반대축 정렬
              // start - 시작
              // end - 끝
              // center - 가운데 (default)
              // stretch - 최대한으로 늘린다.
              crossAxisAlignment: CrossAxisAlignment.start,
              // MainAxisSize - 주축 크기
              // max - 최대
              // min - 최소
              mainAxisSize: MainAxisSize.max,
              children: [
                // Expanded / Flexible : Row나 Column children에서만 사용
                // Expanded / Flexible : Row나 Column children에서만 사용
                // Expanded : 최대한으로 남아있는 공간 다 차지
                // Flexible : 정해진 비율만큼 차지하되, child 내 위젯이 그 공간을 다 차지하면 남는 공간은 버림 처리
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Container(
                  color: Colors.orange,
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  color: Colors.yellow,
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  color: Colors.green,
                  width: 50.0,
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
    );
  }
}