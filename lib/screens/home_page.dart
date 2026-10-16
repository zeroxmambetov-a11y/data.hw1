import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import 'add_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = [];

  
  void _openAddPage() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPage()),
    );

    if (newTask != null && newTask.toString().isNotEmpty) {
      setState(() {
        tasks.insert(0, newTask); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Мои задачи',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.settings, size: 28), onPressed: () {}),
        ],
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'Нет задач. Добавьте новую!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(title: tasks[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddPage,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
