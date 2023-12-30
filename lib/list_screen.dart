import 'package:flutter/material.dart';
import 'package:todolist/create_screen.dart';
import 'package:todolist/todo.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //변수나 상수를 작성하면, stateless위젯은 사용할 수 없게 된다
  //스테이트풀 위젯으로 바꾼당
  final todos = [
    Todo(
      title: 'title 1',
      dateTime: 123123,
    ),
    Todo(
      title: 'title 2',
      dateTime: 12312223,
    ),
    Todo(
      title: 'title 3',
      dateTime: 12312223,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(//List있는 값을 변환해서 표현할때는 map 함수를 쓰면 된다
        children: todos
            .map((todo) => ListTile(
          title: Text(todo.title),
          subtitle: Text('${todo.dateTime}'),//int라 String으로 바꾸려고
        )).toList(),//Iterable로 반환되서 List형태로 바꿔줘야한다
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
