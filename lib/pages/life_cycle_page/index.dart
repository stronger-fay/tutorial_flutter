import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  String componentTitle;
  InheritedTestModel model;

  @override
  void initState() {
    super.initState();

    componentTitle = '父组件属性变更: 韩信';
    model = InheritedTestModel(10);
  }

  @override
  Widget build(BuildContext context) {
    InheritedContext inheritedContext = InheritedContext(
      inheritedTestModel: model,
      increment: () {
        setState(() {
          model = new InheritedTestModel(model.count + 1);
        });
      },
      reduce: () {
        model = new InheritedTestModel(model.count - 1);
      },
      child: LifeCycleComponent(componentTitle),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('组件生命周期'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                if (componentTitle.contains('韩信')) {
                  componentTitle = '父组件属性变更: 李白';
                } else {
                  componentTitle = '父组件属性变更: 韩信';
                }
              });
            },
          ),
        ],
        elevation: 4.0,
      ),
      body: inheritedContext,
    );
  }
}

class InheritedTestModel {
  final int count;
  const InheritedTestModel(this.count);
}

class InheritedContext extends InheritedWidget {
// 数据
  final InheritedTestModel inheritedTestModel;
// 点击 + 号的方法
  final Function() increment;
// 点击 - 号的方法
  final Function() reduce;

  InheritedContext({
    Key key,
    @required this.inheritedTestModel,
    @required this.increment,
    @required this.reduce,
    @required Widget child,
  }) : super(key: key, child: child);

  static InheritedContext of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  //是否重建widget就取决于数据是否相同
  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
    return inheritedTestModel != oldWidget.inheritedTestModel;
  }
}

class LifeCycleComponent extends StatefulWidget {
  final String title;

  LifeCycleComponent(@required this.title);

  @override
  _LifeCycleComponentState createState() => _LifeCycleComponentState();
}

class _LifeCycleComponentState extends State<LifeCycleComponent> {
  int stateCount;

  /// 插入渲染树时调用，只调用一次，widget创建执行的第一个方法，可以再里面初始化一些数据，以及绑定控制器
  @override
  void initState() {
    super.initState();

    stateCount = 2;

    print('initState');
  }

  /// 当State对象的依赖发生变化时会被调用；例如：在之前build() 中包含了一个InheritedWidget，
  /// 然后在之后的build() 中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
  /// InheritedWidget这个widget可以由父控件向子控件共享数据，案例可以参考 scoped_model开源库
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('didChangeDependencies');
  }

  /// 会在didChangeDependencies()、setState()制厚朴调用，调用次数：多次，初始化之后开始绘制界面
  @override
  Widget build(BuildContext context) {
    print('build');

    // 如果不引用 inheritedContext, 则，不会触发 didChangeDependencies()
    final InheritedContext inheritedContext = InheritedContext.of(context);
    final model = inheritedContext.inheritedTestModel;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Divider(),
        Text('title: ${widget.title}'),
        Text('【 修改会依次触发: didUpdateWidget()、build() 】'),
        Divider(),
        Text('inherited context count: ${model.count}', textAlign: TextAlign.left),
        Text(
          '【 依次触发: didUpdateWidget()、didChangeDependencies()、build() 】',
          textAlign: TextAlign.center,
        ),
        RaisedButton(
          child: Text('++'),
          onPressed: () {
            inheritedContext.increment();
          },
        ),
        RaisedButton(
          child: Text('--'),
          onPressed: () {
            inheritedContext.increment();
          },
        ),
        Divider(),
        Text('state count: $stateCount'),
        Text('【 修改会依次触发: build() 】'),
        RaisedButton(
          child: Text('++'),
          onPressed: () {
            setState(() {
              stateCount++;
            });
          },
        ),
        RaisedButton(
          child: Text('--'),
          onPressed: () {
            setState(() {
              stateCount--;
            });
          },
        ),
        Divider(),
      ],
    );
  }

  /// 组件状态改变时候调用，可能会调用多次，只当父组件需要重绘时才会调用
  @override
  void didUpdateWidget(LifeCycleComponent oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('didUpdateWidget oldWidget: $oldWidget');
  }

  /// 这个也很少使用，只在组件被移除时调用，并在dispose()之前调用
  @override
  void deactivate() {
    super.deactivate();

    print('deactivate');
  }

  /// 该生命周期方法很常用，一旦组件被销毁就会调用：
  /// 通常在该方法中执行一些资源的释放工作比如，监听器的卸载，channel的销毁等操作
  @override
  void dispose() {
    super.dispose();

    print('dispose');
  }

  /// 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();

    print('reassemble');
  }
}
