import 'package:easy_refresh_crash/views/tab_bar_controller_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: ListView(
              physics: ScrollPhysics(),
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Press Me',
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => TabBarControllerView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
