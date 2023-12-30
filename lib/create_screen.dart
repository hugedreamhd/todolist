import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController(); //할일을 입력하세요 칸에 들어온 값을 담는다

  @override
  void dispose() {
    _textController.dispose(); //메모리 해제 필수
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo 작성'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(
                  //db를 조작하는 모든 기능은 futuer 오래걸릴 수 있다. 끝나기 전에 pop할수가 있다.
                  Todo(
                title: _textController.text,
                dateTime: DateTime.now().microsecondsSinceEpoch,
              ));

              if (mounted) {
                //mounted = 화면이 잘 표시가 되는가
                Navigator.pop(
                    context); //노랸 라인 - async 키워드가 있을 때 context 가 동작가능 한지 확인해봐라
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController, //텍스트 값을 얻는다
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: '할일을 입력하세요',
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
