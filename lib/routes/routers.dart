import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/not_found_page/index.dart';
import '../pages/home_page/index.dart';
import '../pages/component_life_cycle_page/index.dart';

abstract class IRouterProvider {
  void initRouter(Router router);
}

class Routes {
  static Router router;

  static final List<IRouterProvider> _listRouter = [];

  static String home = '/'; // 首页
  static String componentLifeCycle = '/componentLifeCycle'; // 生命周期

  /// 初始化路由
  static void configureRoutes(Router r) {
    /// 指定路由跳转错误返回页
    r.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return NotFoundPage();
    });

    /// 首页
    r.define(home, handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => HomePage()));
    r.define(componentLifeCycle,
        handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => ComponentLifeCyclePage()));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    // _listRouter.add(MineRouter());
    // _listRouter.add(HomeRouter());
    // _listRouter.add(AccountRouter());
    // _listRouter.add(BindDeviceRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(r);
    });
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(
    BuildContext context,
    String path, {
    Map params,
    TransitionType transition = TransitionType.cupertino,
    bool replace = false,
    bool clearStack = false,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder,
  }) {
    String query = "";

    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);

        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }

    unfocus();

    path = path + query;
    return router.navigateTo(
      context,
      path,
      transition: transition,
      replace: replace,
      clearStack: clearStack,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
    );
  }

  static void pop(BuildContext context) {
    router.pop(context);
  }

  static void unfocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
