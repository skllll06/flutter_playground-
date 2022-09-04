import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  primaryColor,
  isDark,
}

extension PreferenceKeyExt on PreferenceKey {
  Future<String> get keyString async {
    switch (this) {
      case PreferenceKey.primaryColor:
        return 'primary_color';
      case PreferenceKey.isDark:
        return 'is_dark';
    }
  }

  Future<bool> setString(String val) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(await keyString, val);
  }

  Future<String> getString({required String defaultVal}) async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey(await keyString)) {
      return pref.getString(await keyString) ?? defaultVal;
    } else {
      return defaultVal;
    }
  }

  Future<bool> setBool(bool val) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(await keyString, val);
  }

  Future<bool> getBool({required bool defaultVal}) async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey(await keyString)) {
      return pref.getBool(await keyString) ?? defaultVal;
    } else {
      return defaultVal;
    }
  }

  Future<bool> setInt(int value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(await keyString, value);
  }

  Future<int?> getInt({required int defaultValue}) async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey(await keyString)) {
      return pref.getInt(await keyString);
    } else {
      return defaultValue;
    }
  }
}
