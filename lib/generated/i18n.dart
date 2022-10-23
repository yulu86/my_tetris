import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  static final List<Locale> _supportedLocals = [
    const Locale('en', 'US'), // 美国英语
    const Locale('zh', 'CN'), // 简体中文
  ];

  static List<Locale> get supportedLocals => _supportedLocals;

  static AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Locale getMatchedSupportedLocale(
      Locale? locale, Iterable<Locale> supportedLocales) {
    if (locale == null) {
      return supportedLocales.first;
    }

    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  AppLocalizations(this.locale);

  Map<String, String> _localizedValues = {};

  // 从语言文件异步读取国际化信息
  Future<bool> loadJson() async {
    String jsonString =
        await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedValues = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String get cleans => _message("cleans");
  String get level => _message("level");
  String get next => _message("next");
  String get pauseOrResume => _message("pauseOrResume");
  String get points => _message("points");
  String get reset => _message("reset");
  String get reward => _message("reward");
  String get sounds => _message("sounds");

  String _message(String key) {
    return _localizedValues[key]!;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    var supportedLocals = AppLocalizations.supportedLocals;
    for (var supportedLocale in supportedLocals) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.loadJson();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
