import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_app4/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Locale appLocale;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      locale: appLocale ?? Locale(Platform.localeName.split('_')[0]),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('here');
    print(L10n.getFLag(Localizations.localeOf(context).languageCode));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              value: appLocale ?? Localizations.localeOf(context),
              icon: Container(width: 12),
              items: L10n.all.map(
                (locale) {
                  final flag = L10n.getFLag(locale.languageCode);

                  return DropdownMenuItem(
                    child: Center(
                      child: Text(
                        flag,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    value: locale,
                    onTap: () {
                      setState(() {
                        appLocale = locale;
                      });
                    },
                  );
                },
              ).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 72,
                child: Text(
                  L10n.getFLag(Localizations.localeOf(context).languageCode),
                  style: TextStyle(fontSize: 60),
                ),
              ),
              Text(
                AppLocalizations.of(context).language,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                AppLocalizations.of(context).helloWorld,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              Text("hello")
            ],
          ),
        );
      }),
    );
  }
}
