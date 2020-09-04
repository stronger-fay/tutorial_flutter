import 'package:flutter/material.dart';
import 'package:tutorial_flutter/routes/routers.dart';

import '../../main.dart';

class RouterLifeCycleAPage extends StatefulWidget {
  @override
  _RouterLifeCycleAPageState createState() => _RouterLifeCycleAPageState();
}

class _RouterLifeCycleAPageState extends State<RouterLifeCycleAPage> with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)); //订阅
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    // push到当前页面
    debugPrint("------> A didPush");
    super.didPush();
  }

  @override
  void didPop() {
    debugPrint("------> A didPop");
    super.didPop();
  }

  @override
  void didPopNext() {
    debugPrint("------> A didPopNext");
    // pop 到当前页面
    super.didPopNext();
  }

  @override
  void didPushNext() {
    debugPrint("------> A didPushNext");
    super.didPushNext();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this); //取消订阅
    super.dispose();
  }

  // app 进入后台，只触发当前路由内绑定的widget
  @override
  void onAppBackground() {
    print('$this onAppBackground');
  }

  // app 进入前台，只触发当前路由内绑定的widget
  @override
  void onAppForeground() {
    print('$this onAppForeground');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面A'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4.0,
      ),
      body: Container(
        child: RaisedButton(
          child: Text('push to B'),
          onPressed: () {
            Routes.navigateTo(context, Routes.bPage);
          },
        ),
      ),
    );
  }
}
