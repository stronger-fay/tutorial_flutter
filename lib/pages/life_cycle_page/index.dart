import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件生命周期'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4.0,
      ),
      body: Container(),
    );
  }
}
