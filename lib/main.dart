import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm_template/core/init/cache/locale_manager.dart';
import 'package:mvvm_template/view/test/test_view.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/lang/lang_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

Future main() async {
  LocaleManager.preferencesInit();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [...AppProvider.instance!.dependItems],
    child: EasyLocalization(
        path: AppConstants.LANG_ASSET_PATH,
        supportedLocales: LanguageManager.instance!.supportedLocales,
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: NavigationRoute.instance!.generateRoute,
      navigatorKey: NavigationService.instance!.navigatorKey,
      title: 'Flutter MVVM Demo',
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: const TestView(),
    );
  }
}
