import 'package:easy_refresh_crash/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class OneView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<OneView> {
  // Controllers.
  GlobalKey<EasyRefreshState> _refreshKey1 = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _refreshHeaderKey1 = GlobalKey<RefreshHeaderState>();

  @override
  void initState() {
    super.initState();

    // Register callback to execute after the first build.
    SchedulerBinding.instance.addPostFrameCallback((_) => _postFirstBuildSetup());
  }

  void _postFirstBuildSetup() async {
    _refreshKey1.currentState.callRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OneView',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            child: EasyRefresh(
              key: _refreshKey1,
              behavior: ScrollBehavior(),
              refreshHeader: ClassicsHeader(
                key: _refreshHeaderKey1,
                refreshText: 'Pull To Refresh',
                refreshReadyText: 'Release To Refresh',
                refreshingText: 'Refreshing...',
                refreshedText: 'Refreshed',
                bgColor: Colors.transparent,
                textColor: Colors.grey,
              ),
              onRefresh: () async {
                await _onRefresh();
              },
              child: ListView(
                children: <Widget>[
                  Text('''\n
                    On the tab bar at the bottom,\n
                    DO NOT press 'TwoView'\n
                    PRESS 'logout' button below.\n
                    The plugin will produce an exception.\n
                  '''),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: RaisedButton(
                      child: Text(
                        'logout',
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginView(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Executes when objects master list needs to be refreshed.
  Future _onRefresh() async {
    return await Future.delayed(Duration(seconds: 4));
  }
}
