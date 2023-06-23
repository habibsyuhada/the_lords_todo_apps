import 'package:flutter/material.dart';
import 'package:the_lords_todo_apps/src/screens/task/task_new_view.dart';
import 'package:the_lords_todo_apps/src/screens/task/task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TaskView(),
    Center(
      child: Text(
        'Habit',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Activity',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Catalog',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.restorablePushNamed(
            context,
            TaskNewView.routeName,
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.task_alt,
                color: Colors.white,
              ),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.exposure,
                color: Colors.white,
              ),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            SizedBox(
              // height: 50,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.collections_bookmark,
                color: Colors.white,
              ),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
