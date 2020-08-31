import 'package:flutter/material.dart';
import 'package:tutorial_flutter/routes/routers.dart';

class RouterLifeCycleBPage extends StatefulWidget {
  @override
  _RouterLifeCycleBPageState createState() => _RouterLifeCycleBPageState();
}

class _RouterLifeCycleBPageState extends State<RouterLifeCycleBPage> {
  @override
  void initState() {
    super.initState();

    print('b initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('b didChangeDependencies');
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
      body: Container(
          // child: RaisedButton(
          //   child: Text('push to B'),
          //   onPressed: () {
          //     // Routes.navigateTo(context, Routes.)
          //   },
          // ),
          ),
    );
  }

  @override
  void didUpdateWidget(RouterLifeCycleBPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('b didUpdateWidget oldWidget: $oldWidget');
  }

  @override
  void deactivate() {
    super.deactivate();

    print('b deactivate');
  }

  @override
  void dispose() {
    super.dispose();

    print('b dispose');
  }

  @override
  void reassemble() {
    super.reassemble();

    print('b reassemble');
  }
}
