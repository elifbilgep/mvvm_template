import 'package:mvvm_template/core/init/navigation/navigation_service.dart';
import 'package:mvvm_template/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static AppProvider? _instance;
  static AppProvider? get instance {
    _instance ??= AppProvider._init();
    return _instance;
  }

  //Singleton
  AppProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    Provider.value(value: NavigationService.instance!.navigatorKey)
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
