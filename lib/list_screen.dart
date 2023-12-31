import 'package:flutter/material.dart';
import 'package:todolist/create_screen.dart';
import 'package:todolist/main.dart';
import 'package:todolist/todo.dart';
import 'package:todolist/todo_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //변수나 상수를 작성하면, stateless위젯은 사용할 수 없게 된다
  //스테이트풀 위젯으로 바꾼당
  // final todos = [
  //   Todo(
  //     title: 'title 1',
  //     dateTime: 123123,
  //   ),
  //   Todo(
  //     title: 'title 2',
  //     dateTime: 12312223,
  //   ),
  //   Todo(
  //     title: 'title 3',
  //     dateTime: 12312223,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          '해야할 일 목록 작성하기',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/img/note_image.png'),
           fit: BoxFit.fill,
         ),
        ),
        child: ListView(
          //List있는 값을 변환해서 표현할때는 map 함수를 쓰면 된다
          children: todos.values
              .map((e) => TodoItem(
                    todo: e,
                    onTap: (todo) async {
                      //이 todo는 todo.dart에서 온 todo, 결국 e와 todo는 같은 값이다
                      todo.isDone = !todo.isDone;
                      await todo.save();

                      setState(() {}); //await todo.save를 기달려서 다 되면 갱신
                    },
                    onDelete: (todo) async {
                      await todo.delete();

                      setState(() {});
                    },
                  ))
              .toList(), //Iterable로 반환되서 List형태로 바꿔줘야한다
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            //push도 future 타입 - 돌아올때까지 기다릴수 있는 함수
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
