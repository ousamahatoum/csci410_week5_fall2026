import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(child: Column(children: [
        const SizedBox(height: 20),
        Text('You typed: $_text', style: TextStyle(fontSize: 18)),
        SizedBox(width: 300, height: 50,
        child: TextField(
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter some text'
          ),
          onChanged: (text) => setState(() {
            _text = text;
          }),
        ))
      ],)),
    );
  }
}
