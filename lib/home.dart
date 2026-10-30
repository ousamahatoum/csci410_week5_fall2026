import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';

  void updateText(String text) {
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(child: Column(children: [
        const SizedBox(height: 20),
        Text('You typed: $_text', style: TextStyle(fontSize: 18)),
        MyTextField(f: updateText, hint: 'Enter some text')
      ],)),
    );
  }
}

class MyTextField extends StatelessWidget {
  final Function(String) f;
  final String hint;

  const MyTextField({
    required this.f,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300, height: 50,
      child: TextField(
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        border: OutlineInputBorder(), hintText: hint
      ),
      onChanged: (text) => f(text),
    ));
  }
}
