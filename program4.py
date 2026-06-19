# Develop a “To-do List” Application. 

import 'package:flutter/material.dart'; 
void main() => runApp(const MaterialApp(home: TodoApp())); 
class TodoApp extends StatefulWidget { 
  const TodoApp({super.key}); 
  @override 
  State createState() => _TodoAppState(); } 
class _TodoAppState extends State { 
  final tasks = []; 
  final controller = TextEditingController(); 
  void addTask() { 
    if (controller.text.isNotEmpty) { 
      setState(() { 
        tasks.add(controller.text); 
        controller.clear(); 
      }); }} 
  void removeTask(int index) { 
    setState(() => tasks.removeAt(index)); 
  } 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text("To-Do List")), 
      body: Padding( 
        padding: const EdgeInsets.all(16), 
        child: Column( 
          children: [ 
            TextField( 
              controller: controller, 
              decoration: const InputDecoration( 
                hintText: 'Enter task', 
                suffixIcon: Icon(Icons.task), ), 
              onSubmitted: (_) => addTask(), ), 
            const SizedBox(height: 10), 
            Expanded( 
              child: ListView.builder( 
                itemCount: tasks.length, 
                itemBuilder: (_, i) => ListTile( 
                  title: Text(tasks[i]), 
                  trailing: IconButton( 
                    icon: const Icon(Icons.delete, color: Colors.red), 
                    onPressed: () => removeTask(i), 
                  ),),)), ],), ), 
      floatingActionButton: FloatingActionButton( 
        onPressed: addTask, 
        child: const Icon(Icons.add), 
      ),); }} 

