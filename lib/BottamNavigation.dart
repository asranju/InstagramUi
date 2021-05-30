import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/IntagramScreen.dart';

class BottomNavigation extends StatefulWidget {
  Bottom createState() => Bottom();
}

class Bottom extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    InstagramScreen(),
    InstagramScreen(),
    InstagramScreen(),
    InstagramScreen(),
  ];

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Instagram",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            actions: <Widget>[
              Badge(
                  position: BadgePosition.topEnd(top: 5, end: 3),
                  badgeContent: Text('10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                  badgeColor: Colors.red,
                  child: IconButton(
                    icon: Icon(
                      Icons.near_me_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {},
                  ))
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {},
                );
              },
            ),
          ),
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.black), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_add, color: Colors.black),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border, color: Colors.black),
                  label: ""),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.red,
            onTap: onTabTapped,
          ),
        ));
  }
}
