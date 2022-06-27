import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: const HomeWidget(title: 'Flex'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  final String title;
  const HomeWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _vertical = true;
  int _alignTextIndex = 0;

  final List<MainAxisAlignment> _alignment = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
  ];
  final List<String> _alignmentText = [
    'start',
    'end',
    'center',
    'spaceAround',
    'spaceBetween',
    'spaceEvenly',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex Demo'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _vertical = !_vertical;
              });
            },
            tooltip: 'Axis direction',
            icon: const Icon(
              Icons.rotate_right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(_vertical ? 'Vertical' : 'Horizontal'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _alignTextIndex++;
                if (_alignTextIndex >= _alignment.length) {
                  _alignTextIndex = 0;
                }
              });
            },
            tooltip: 'alignment',
            icon: const Icon(
              Icons.aspect_ratio,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(_alignmentText[_alignTextIndex]),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
      body: Flex(
        direction: _vertical ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: _alignment[_alignTextIndex],
        children: [
          RawMaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            fillColor: Colors.purple,
            child: const Text(
              'One',
              style: TextStyle(color: Colors.white),
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: Colors.grey,
            child: const Text(
              'Ywo',
              style: TextStyle(color: Colors.white),
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            fillColor: Colors.amber,
            child: const Text(
              'Three',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
