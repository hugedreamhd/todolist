import 'package:flutter/material.dart';
import 'package:todolist/create_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('title 1'),
            subtitle: Text('subtitle 1'),
          ),
          ListTile(
            title: Text('title 1'),
            subtitle: Text('subtitle 1'),
          ),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
           const CreateScreen()),
          );
        },
        child: const Icon(Icons.add),

      ),
    );
  }
}
