class Todo {
  // 클래스 만들 때는 내가 표현하고자 하는 객체를 보고 그 속성을 도출해내면 된다
  //이 안에는 필드라 부른다
  String title;
  int dateTime; // int 값으로 저장하고 변환해서 표시해보자

  Todo({
    required this.title,
    required this.dateTime,
  }); //필수 생성자(named parameter)
}

//TOdo('내용', 123123)
//좀 더 플러터 스럽게는
//Todo(title: '내용', dateTime 1233);
