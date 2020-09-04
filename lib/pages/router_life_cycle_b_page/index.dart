import 'package:flutter/material.dart';

import '../../main.dart';

class RouterLifeCycleBPage extends StatefulWidget {
  @override
  _RouterLifeCycleBPageState createState() => _RouterLifeCycleBPageState();
}

class _RouterLifeCycleBPageState extends State<RouterLifeCycleBPage> with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)); //订阅
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    debugPrint("------> B didPush");
    super.didPush();
  }

  @override
  void didPop() {
    debugPrint("------> B didPop");
    super.didPop();
  }

  @override
  void didPopNext() {
    debugPrint("------> B didPopNext");
    super.didPopNext();
  }

  @override
  void didPushNext() {
    debugPrint("------> B didPushNext");
    super.didPushNext();
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
        title: Text('页面B'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4.0,
      ),
      body: Container(),
    );
  }
}
