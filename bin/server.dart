import 'package:redstone/redstone.dart';
import 'package:redstone_mvc/redstone_mvc.dart';
import 'package:redstone_mapper/plugin.dart';
import 'package:di/di.dart';
import 'package:shelf_static/shelf_static.dart';

import 'package:mvc_example/controllers.dart';


main() async {

  //add plugins
  addPlugin(mvcPluggin);
  addPlugin(getMapperPlugin());
  configureMvc();

  //avoid error page for redirects
  showErrorPage = false;

  //add dependency injection
  addModule(new Module()
    ..bind(ExamplesServices)
    ..bind(ExamplesController));

  //add static files handles
  setShelfHandler(createStaticHandler('web'));

  //regular start
  setupConsoleLog();
  await start();
}

@Get('/') index () => redirect('/examples');
