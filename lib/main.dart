import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/list_screen.dart';
import 'package:todolist/todo.dart';

late final Box<Todo> todos; //탑레벨(아무데서나 접근가능한 곳)에 늦게 값을 초기화 하겠다 밑에 todos에서

Future<void> main() async {

  await Hive.initFlutter(); //Hive 초기화 await를 왜 제거해도 된다고 그러지?
//Hive가 todo라는 객체를 알 수 있도록 알려줘야 한당
  Hive.registerAdapter(TodoAdapter()); //준비 완료

  todos = await Hive.openBox<Todo>('todolist.db'); //db이름 작성 후에 그에 맞는 타입을 <generic>안에 넣는다 - 초기화
  //todos 객체를 통해서 db에 접근 가능
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListScreen(),
    );
  }
}
