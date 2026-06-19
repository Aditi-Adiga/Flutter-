# Develop an application using Flutter to Increment and Decrement numbers. 
import 'package:flutter/material.dart'; 
void main() => runApp(const MaterialApp(home: CounterApp())); 
class CounterApp extends StatefulWidget { 
  const CounterApp({super.key}); 
  @override 
  State createState() => _CounterAppState(); 
} 
class _CounterAppState extends State { 
  int count = 0; 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text("Counter App")), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            Text('$count', style: const TextStyle(fontSize: 40)), 
            Row( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [ 
                IconButton(onPressed: () => setState(() => count--), icon: const Icon(Icons.remove)), 
                IconButton(onPressed: () => setState(() => count++), icon: const Icon(Icons.add)), 
              ], ), ],),),  );}}
