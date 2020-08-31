import 'package:flutter/material.dart';

class AppLifeCyclePage extends StatefulWidget {
  @override
  _AppLifeCyclePageState createState() => _AppLifeCyclePageState();
}

class _AppLifeCyclePageState extends State<AppLifeCyclePage> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // state对应生命周期回调
    print('AsyncSnapshotLifeCycle:' + state.toString());
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this); // 注册监听器
    print('initState: addObserver');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App生命周期'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4.0,
      ),
      body: Container(),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 移除监听器
    print('dispose: removeObserver');
    super.dispose();
  }
}
