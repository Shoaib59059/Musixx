import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
          // color: Colors.,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
            onPressed: () {
              setBottomBarIndex(0);
            },
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.green : Colors.grey,
            )),
        IconButton(
            onPressed: () {
              setBottomBarIndex(1);
            },
            icon: Icon(
              Icons.search,
              color: currentIndex == 1 ? Colors.green : Colors.grey,
            )),
        IconButton(
            onPressed: () {
              setBottomBarIndex(2);
            },
            icon: Icon(
              Icons.book,
              color: currentIndex == 2 ? Colors.green : Colors.grey,
            )),
        IconButton(
            onPressed: () {
              setBottomBarIndex(3);
            },
            icon: Icon(
              Icons.person,
              color: currentIndex == 3 ? Colors.green : Colors.grey,
            ))
      ])),
    );
  }
}
