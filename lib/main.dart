import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/lang/lang_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: AppConstants.LANG_ASSET_PATH,
      supportedLocales: LanguageManager.instance!.supportedLocales,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...AppProvider.instance!.dependItems],
      child: MaterialApp(
        onGenerateRoute: NavigationRoute.instance!.generateRoute,
        navigatorKey: NavigationService.instance!.navigatorKey,
        title: 'Flutter MVVM Demo',
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hey"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("")],
        ),
      ),
    );
  }
}
