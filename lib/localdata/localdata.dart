import 'package:shared_preferences/shared_preferences.dart';

class DBservice {
  static SharedPreferences? _preferences;

  static Future setStList(
      {required String key, required List<String> value}) async {
    await _preferences!.setStringList(key, value);
  }
}
