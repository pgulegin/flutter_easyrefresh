import 'package:easy_refresh_crash/views/one_view.dart';
import 'package:easy_refresh_crash/views/two_view.dart';
import 'package:flutter/material.dart';

class TabBarControllerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<TabBarControllerView> with SingleTickerProviderStateMixin {
  // Controllers.
  TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Sets the amount of tabs for the controller.
    _controller = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose tab bar controller.
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Offstage(
                offstage: _currentIndex != 0,
                child: TickerMode(
                  enabled: _currentIndex == 0,
                  child: OneView(),
                ),
              ),
              Offstage(
                offstage: _currentIndex != 1,
                child: TickerMode(
                  enabled: _currentIndex == 1,
                  child: TwoView(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => _onTap(index),
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(
                'OneView',
              ),
              icon: Icon(
                Icons.import_contacts,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.import_contacts,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'TwoView',
              ),
              icon: Icon(
                Icons.credit_card,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.credit_card,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Executes when user changes tabs.
  void _onTap(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
