import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      print('get localizations');
      final AppLocalizations localizations = AppLocalizations.of(context);
      print('localizations: $localizations');
      print('localizations.helloWorld');
      final List<String> results = <String>[
        '${localizations.helloWorld}',
        '${localizations.hello("World")}',
        '${localizations.greeting("Hello", "World")}',
        '${localizations.helloWorldOn(DateTime(1960))}',
        '${localizations.helloOn("world argument", DateTime(1960), DateTime(1960))}',
        '${localizations.helloWorldDuring(DateTime(1960), DateTime(2020))}',
        '${localizations.helloFor(123)}',
        '${localizations.helloCost("price", 123)}',
        '${localizations.helloWorlds(0)}',
        '${localizations.helloWorlds(1)}',
        '${localizations.helloWorlds(2)}',
        '${localizations.helloWorldsOn(0, DateTime(1960))}',
        '${localizations.helloWorldsOn(1, DateTime(1960))}',
        '${localizations.helloWorldsOn(2, DateTime(1960))}',
        '${localizations.helloAdjectiveWorlds(0, "new")}',
        '${localizations.helloAdjectiveWorlds(1, "new")}',
        '${localizations.helloAdjectiveWorlds(2, "new")}',
        '${localizations.helloWorldPopulation(0, 100)}',
        '${localizations.helloWorldPopulation(1, 101)}',
        '${localizations.helloWorldPopulation(2, 102)}',
        '${localizations.helloWorldInterpolation("Hello", "World")}',
        '${localizations.helloWorldsInterpolation(123, "Hello", "World")}',
      ];
      int n = 0;
      for (final String result in results) {
        print('#l10n $n ($result)\n');
        n += 1;
      }
    } finally {
      print('#l10n END\n');
    }
    return MaterialApp(
      home: Container(
        color: Colors.blue,
      )
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: <Locale>[
        Locale('en', 'CA'),
        Locale('en'),
      ],
      home: Home(),
    ),
  );
}