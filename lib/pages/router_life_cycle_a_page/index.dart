import 'package:flutter/material.dart';
import 'package:tutorial_flutter/routes/routers.dart';

class RouterLifeCycleAPage extends StatefulWidget {
  @override
  _RouterLifeCycleAPageState createState() => _RouterLifeCycleAPageState();
}

class _RouterLifeCycleAPageState extends State<RouterLifeCycleAPage> {
  @override
  void initState() {
    super.initState();

    print('a initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('a didChangeDependencies');
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

  @override
  void didUpdateWidget(RouterLifeCycleAPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('a didUpdateWidget oldWidget: $oldWidget');
  }

  @override
  void deactivate() {
    super.deactivate();

    print('a deactivate');
  }

  @override
  void dispose() {
    super.dispose();

    print('a dispose');
  }

  @override
  void reassemble() {
    super.reassemble();

    print('a reassemble');
  }
}
