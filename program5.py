# Develop Calculator Application. 
 
import 'package:flutter/material.dart'; 
void main() => runApp(const MaterialApp(home: CalculatorApp())); 
class CalculatorApp extends StatefulWidget { 
  const CalculatorApp({super.key}); 
  @override 
  State createState() => _CalculatorAppState(); 
} 
class _CalculatorAppState extends State { 
  final num1 = TextEditingController(); 
  final num2 = TextEditingController(); 
  String result = ''; 
  void calculate(String op) { 
    double a = double.tryParse(num1.text) ?? 0; 
    double b = double.tryParse(num2.text) ?? 0; 
    double res = 0; 
    switch (op) { 
      case '+': res = a + b; break; 
      case '-': res = a - b; break; 
      case '*': res = a * b; break; 
      case '/': res = b != 0 ? a / b : 0; break; 
    } 
    setState(() => result = 'Result: $res'); } 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Simple Calculator')), 
      body: Padding( 
        padding: const EdgeInsets.all(20), 
        child: Column( 
          children: [ 
            TextField(controller: num1, keyboardType: TextInputType.number, decoration: const 
InputDecoration(labelText: 'Number 1')), 
            TextField(controller: num2, keyboardType: TextInputType.number, decoration: const 
InputDecoration(labelText: 'Number 2')), 
            const SizedBox(height: 20), 
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
              children: ['+', '-', '*', '/'].map((op) { 
                return ElevatedButton( 
                  onPressed: () => calculate(op), 
                  child: Text(op), 
                ); 
              }).toList(), ), 
            const SizedBox(height: 20), 
            Text(result, style: const TextStyle(fontSize: 24)), 
          ],  ), ),);}}
