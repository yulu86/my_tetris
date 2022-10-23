import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_tetris/gamer/game.dart';
import 'package:my_tetris/gamer/keyboard.dart';
import 'package:my_tetris/generated/i18n.dart';
import 'package:my_tetris/material/sound.dart';
import 'package:my_tetris/panel/landscape_page.dart';
import 'package:my_tetris/panel/portrait_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.tetris,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Sound(child: Game(child: KeyboardController(child: _HomePage()))),
      ),
      // 国际化
      localizationsDelegates: [
        // 本地化代理
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      // 支持的语言
      supportedLocales: AppLocalizations.supportedLocals,
      // 检测当前语言
      localeResolutionCallback: AppLocalizations.getMatchedSupportedLocale,
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Android/iOS support land mode
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape ? LandscapePage() : PortraitPage();
  }
}
