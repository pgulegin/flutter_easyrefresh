import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class TwoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<TwoView> {
  // Controllers.
  GlobalKey<EasyRefreshState> _refreshKey2 = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _refreshHeaderKey2 = GlobalKey<RefreshHeaderState>();

  @override
  void initState() {
    super.initState();

    // Register callback to execute after the first build.
    SchedulerBinding.instance.addPostFrameCallback((_) => _postFirstBuildSetup());
  }

  void _postFirstBuildSetup() async {
    _refreshKey2.currentState.callRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TwoView',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            child: EasyRefresh(
              key: _refreshKey2,
              behavior: ScrollBehavior(),
              refreshHeader: ClassicsHeader(
                key: _refreshHeaderKey2,
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
                  Container(
                    height: 100,
                    color: Colors.red,
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
