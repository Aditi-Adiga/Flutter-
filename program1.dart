# Develop an application using Flutter to print “Hello world and Hello Flutter”. 
 
import 'package:flutter/material.dart'; 
void main() { 
  runApp(const MyApp());
} 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Hello Flutter App', 
      home: Scaffold( 
        appBar: AppBar( 
          title: const Text('Hello App'), 
        ), 
        body: const Center( 
          child: Text( 
            'Hello world and Hello Flutter', 
            style: TextStyle(fontSize: 24), 
          ), 
        ), 
      ), 
    ); 
  } 
}
