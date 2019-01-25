import 'dart:convert';

import 'package:flutter_app/model/language.dart';
import 'package:quiver/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String KEY_LANGUAGE = 'key_language';
const String KEY_THEME_COLOR = 'key_theme_color';

const String SP_JINRISHICI_TOKEN = "jinrishici_token";

const String SP_USERNAME = "username";
const String SP_AVATAR = "avatar";

class SpHelper {
  // 需要在 main.dart 初始化
  static SharedPreferences sp;

  // T 用于区分存储类型
  static void putObject<T>(String key, Object value) {
    switch (T) {
      case int:
        sp.setInt(key, value);
        break;
      case double:
        sp.setDouble(key, value);
        break;
      case bool:
        sp.setBool(key, value);
        break;
      case String:
        sp.setString(key, value);
        break;
      case List:
        sp.setStringList(key, value);
        break;
      default:
        sp.setString(key, value == null ? "" : json.encode(value));
        break;
    }
  }

  // 获取设置好的语言
  static LanguageModel getLanguageModel() {
    String _saveLanguage = sp.getString(KEY_LANGUAGE);
    if (isNotEmpty(_saveLanguage)) {
      Map userMap = json.decode(_saveLanguage);
      return LanguageModel.fromJson(userMap);
    }
    return null;
  }

  // 获取设置好的主题
  static String getThemeColor() {
    String _colorKey = sp.getString(KEY_THEME_COLOR);
    if (isEmpty(_colorKey)) {
      _colorKey = 'gray';
    }
    return _colorKey;
  }
}