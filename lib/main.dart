import 'package:flutter/material.dart';
import 'package:flutter_app/screen/google_map_screen.dart';
import 'package:flutter_app/screen/home_screen_widget.dart';
import 'package:flutter_app/screen/profile_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexSelect = 0;
  void onTapIndex(int index) {
    setState(() {
      indexSelect = index;
    });
  }

  List<Widget> pages = [
    const HomeScreenWidget(),
    const ProfileScreenWidget(),
    const GoogleMapScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
        ),
      ),
      body: pages[indexSelect],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexSelect,
          onTap: onTapIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined), label: 'Maps')
          ]),
    );
  }
}
