import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete; //메모 내용 지워지는 콜백

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //클릭이 되게 되면 isDone 값의 반대 값이 DB에 저장이 되면서 다시 그려져야한다.
        //콜백 함수 필요 -> 콜백이란? 내부에서 수행할 일을 다른 파일(바깥에서 수행 할 수 있게 한다 function을 이용!!)
        onTap(todo); //ListTile을 클릭하게 되면 ontap함수에게 todo를 전달하게 된다
      },
      leading: todo.isDone
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.check_circle_outline),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
        DateFormat.yMMMd()
            .format(DateTime.fromMicrosecondsSinceEpoch(todo.dateTime)),
        //flutter pub add intl 패키지 이용
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      //int라 String으로 바꾸려고
      trailing: todo.isDone
          ? GestureDetector(
              onTap: () {
                onDelete(todo);
              },
              child: const Icon(Icons.delete_forever),
            )
          : null, //뒤 영역
    );
  }
}
