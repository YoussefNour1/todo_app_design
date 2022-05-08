import 'package:flutter/material.dart';
import 'package:todo_app_design/dane_task.dart';
import 'package:todo_app_design/new_task.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Georgia',
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          headline6: TextStyle(
              fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),
          bodyText2:
              TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.grey),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "ToDo",
      home: const HomeLayout(),
    );
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: const [
          Icon(Icons.person_add_rounded),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: index == 0 ? const NewTask() : const DoneTask(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        elevation: 15,
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task), label: "New Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), label: "Done Tasks"),
        ],
      ),
    );
  }
}
