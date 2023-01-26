import 'package:mvvm_template/core/init/enums/preferences_key_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static LocaleManager? _instance = LocaleManager._init();
  SharedPreferences? _sharedPreferences;
  static LocaleManager? get instance => _instance;

  //Singleton
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  static preferencesInit() async {
    instance?._sharedPreferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<void> setStringValue(PreferencesKeyEnum key, String value) async {
    await _sharedPreferences!.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeyEnum? key) => _sharedPreferences!.getString(key.toString()) ?? "";
}
