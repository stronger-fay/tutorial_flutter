import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:tutorial_flutter/pages/home_page/index.dart';
import 'package:tutorial_flutter/pages/not_found_page/index.dart';
import 'package:tutorial_flutter/routes/routers.dart';

// import './routes/routers.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    //-------------------主要代码start
    final Router router = Router(); // 路由初始化
    Routes.configureRoutes(router);
    Routes.router = router;
    //-------------------主要代码end
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',

      home: HomePage(),
      // 页面生命周期
      navigatorObservers: [
        routeObserver, // route listener
      ],
      //----------------主要代码start
      onGenerateRoute: Routes.router.generator, //路由静态化
      //----------------主要代码end

      /// 因为使用了fluro，这里设置主要针对Web
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (BuildContext context) => NotFoundPage(),
        );
      },
    );
  }
}
