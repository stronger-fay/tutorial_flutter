import 'package:flutter/material.dart';
import 'package:tutorial_flutter/routes/routers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];

  @override
  void initState() {
    super.initState();

    list = [
      {'title': '组件生命周期', 'route': Routes.componentLifeCycle},
      {'title': 'App生命周期', 'route': Routes.appLifeCycle},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4.0,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index]['title']),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Routes.navigateTo(context, list[index]['route']),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: list.length,
      ),
    );
  }
}
