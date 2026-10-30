import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _image = 'assets/p1.jpg';

  final List<String> _images = [
  'assets/p1.jpg',
  'assets/p2.jpg',
  'assets/p3.jpg',
  'assets/p4.jpg'
  ];

  int _count = 0;


  String _text = '';
  double _x = -1, _y = -1;

  void updateX(String x) {
    if (x.trim() == '') {
      _x = -1;
    }
    else {
      _x = double.parse(x);
    }
  }

  void updateY(String y) {
    if (y.trim() == '') {
      _y = -1;
    }
    else {
      _y = double.parse(y);
    }
  }

  void updateText() {
    setState(() {
      _count = (_count + 1) % _images.length;
      _image = _images[_count];

      if (_x == -1 || _y == -1) {
        _text = 'Please fill all fields';
      }
      else {
        _text = (_x + _y).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(child: Column(children: [
        const SizedBox(height: 10),
        Text('SUM: $_text', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        MyTextField(f: updateX, hint: 'Enter X'),
        const SizedBox(height: 10),
        MyTextField(f: updateY, hint: 'Enter Y'),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: updateText, child: const Text('SUM', style: TextStyle(fontSize: 24))),
        const SizedBox(height: 10),
        Image.asset(_image, width: 250, height: 250)
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
      keyboardType: TextInputType.number,
      onChanged: (text) => f(text),
    ));
  }
}
