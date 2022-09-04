import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../preference_key.dart';

final themeModeProvider = FutureProvider<ThemeData>((ref) async {
  await ref.watch(isDarkProvider.notifier).loadThemeMode();
  await ref.watch(themePrimaryColorProvider.notifier).loadThemePrimaryColor();
  final Color primaryColor = ref.watch(themePrimaryColorProvider);
  return ref.watch(isDarkProvider)
      ? ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(color: primaryColor),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all<Color>(primaryColor),
            trackColor: MaterialStateProperty.all<Color>(primaryColor),
            overlayColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: primaryColor),
          ),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: primaryColor),
        )
      : ThemeData.light().copyWith(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(color: primaryColor),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all<Color>(primaryColor),
            trackColor: MaterialStateProperty.all<Color>(primaryColor),
            overlayColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: primaryColor),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
        );
});

final themePrimaryColorProvider =
    StateNotifierProvider<ThemePrimaryColorController, Color>(
        (_) => ThemePrimaryColorController());

class ThemePrimaryColorController extends StateNotifier<Color> {
  ThemePrimaryColorController() : super(Colors.blue);

  void togglePrimaryColor(String val) {
    switch (val) {
      case 'blue':
        state = Colors.blue;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'red':
        state = Colors.red;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'yellow':
        state = Colors.lime;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'pink':
        state = Colors.pinkAccent;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'green':
        state = Colors.green;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'purple':
        state = Colors.deepPurple;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'brown':
        state = Colors.brown;
        PreferenceKey.primaryColor.setString(val);
        break;
      case 'grey':
        state = Colors.grey;
        PreferenceKey.primaryColor.setString(val);
        break;
      default:
        state = Colors.blue;
        PreferenceKey.primaryColor.setString('blue');
        break;
    }
  }

  Future<void> loadThemePrimaryColor() async {
    final color =
        await PreferenceKey.primaryColor.getString(defaultVal: 'blue');
    togglePrimaryColor(color);
  }
}

final isDarkProvider = StateNotifierProvider<ThemeModeController, bool>(
    (_) => ThemeModeController());

class ThemeModeController extends StateNotifier<bool> {
  ThemeModeController() : super(false);

  void toggleThemeMode(bool val) {
    state = val;
    PreferenceKey.isDark.setBool(val);
  }

  Future<void> loadThemeMode() async {
    final isDark = await PreferenceKey.isDark.getBool(defaultVal: false);
    state = isDark;
  }
}
