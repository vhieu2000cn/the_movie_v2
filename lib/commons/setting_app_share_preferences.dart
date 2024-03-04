import 'package:shared_preferences/shared_preferences.dart';

class SettingAppSharePreferences {
  static const String _sharePreferencesSettingModeView =
      'sharePreferencesSettingModeView';

  static setModeView(int modeView) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(_sharePreferencesSettingModeView, modeView);
  }

  static Future<int> getModeView() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(_sharePreferencesSettingModeView) ?? 0;
  }
}
