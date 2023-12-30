import 'package:hive/hive.dart';
part 'todo.g.dart'; //build_runner 할 때 오류생기면 넣는다
@HiveType(typeId: 0)//Hive라는 데이터베이스에 저장 할 수 있는 객체가 된다
class Todo extends HiveObject {
  //id를 통해서 unique한 객체를 판단하는 근거가 된다
  // 클래스 만들 때는 내가 표현하고자 하는 객체를 보고 그 속성을 도출해내면 된다
  //이 안에는 필드라 부른다
  @HiveField(0)//flutter pub run build_runner build

  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int dateTime; // int 값으로 저장하고 변환해서 표시해보자

  @HiveField(3)
  bool isDone;//완료를 했는지 안했는지 알수 있는 상태값을 알려줘야한다

  Todo({
    required this.title,
    required this.dateTime,
    this.isDone= false, // 초기화 기본값
  }); //필수 생성자(named parameter)
}



//Todo('내용', 123123)
//좀 더 플러터 스럽게는
//Todo(title: '내용', dateTime 1233);
