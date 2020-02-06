import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: 0.16.0
///   intl_translation: 0.17.7
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.

// ignore_for_file: unnecessary_brace_in_string_interps

class AppLocalizations {
  AppLocalizations(Locale locale) : _localeName = Intl.canonicalizedLocale(locale.toString());

  final String _localeName;

  static Future<AppLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString())
      .then<AppLocalizations>((_) => AppLocalizations(locale));
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('en', 'CA'),
  ];

  String greeting(Object hello, Object world) {
    return Intl.message(
      '${hello} ${world}',
      locale: _localeName,
      name: 'greeting',
      desc: 'A message with a two parameters',
      args: <Object>[hello, world]
    );
  }

  String hello(Object world) {
    return Intl.message(
      'Hello ${world}',
      locale: _localeName,
      name: 'hello',
      desc: 'A message with a single parameter',
      args: <Object>[world]
    );
  }

  String helloAdjectiveWorlds(int count, Object adjective) {
    return Intl.plural(
      count,
      locale: _localeName,
      name: 'helloAdjectiveWorlds',
      desc: 'A plural message with an additional parameter',
      args: <Object>[count, adjective],
      zero: 'Hello',
      one: 'Hello ${adjective} World',
      two: 'Hello two ${adjective} worlds',
      other: 'Hello other ${count} ${adjective} worlds'
    );
  }

  String helloCost(Object price, int value) {
    final NumberFormat valueNumberFormat = NumberFormat.currency(
      locale: _localeName,
    );
    final String valueString = valueNumberFormat.format(value);

    String helloCost(Object price, Object value) {
      return Intl.message(
        'Hello for ${price} ${value}',
        locale: _localeName,
        name: 'helloCost',
        desc: 'A message with string and int (currency) parameters',
        args: <Object>[price, value]
      );
    }
    return helloCost(price, valueString);
  }

  String helloFor(double value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: _localeName,
    );
    final String valueString = valueNumberFormat.format(value);

    String helloFor(Object value) {
      return Intl.message(
        'Hello for ${value}',
        locale: _localeName,
        name: 'helloFor',
        desc: 'A message with a double parameter',
        args: <Object>[value]
      );
    }
    return helloFor(valueString);
  }

  String helloOn(Object world, DateTime date, DateTime time) {
    final DateFormat dateDateFormat = DateFormat.yMd(_localeName);
    final String dateString = dateDateFormat.format(date);

    final DateFormat timeDateFormat = DateFormat.Hm(_localeName);
    final String timeString = timeDateFormat.format(time);

    String helloOn(Object world, Object date, Object time) {
      return Intl.message(
        'Hello ${world} on ${date} at ${time}',
        locale: _localeName,
        name: 'helloOn',
        desc: 'A message with date and string parameters',
        args: <Object>[world, date, time]
      );
    }
    return helloOn(world, dateString, timeString);
  }

  String get helloWorld {
    return Intl.message(
      'Hello World',
      locale: _localeName,
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting'
    );
  }

  String helloWorldDuring(DateTime startDate, DateTime endDate) {
    final DateFormat startDateDateFormat = DateFormat.y(_localeName);
    final String startDateString = startDateDateFormat.format(startDate);

    final DateFormat endDateDateFormat = DateFormat.y(_localeName);
    final String endDateString = endDateDateFormat.format(endDate);

    String helloWorldDuring(Object startDate, Object endDate) {
      return Intl.message(
        'Hello World from ${startDate} to ${endDate}',
        locale: _localeName,
        name: 'helloWorldDuring',
        desc: 'A message with two date parameters',
        args: <Object>[startDate, endDate]
      );
    }
    return helloWorldDuring(startDateString, endDateString);
  }

  String helloWorldInterpolation(Object hello, Object world) {
    return Intl.message(
      '[${hello}] #${world}#',
      locale: _localeName,
      name: 'helloWorldInterpolation',
      desc: 'A message with parameters that need string interpolation braces',
      args: <Object>[hello, world]
    );
  }

  String helloWorldOn(DateTime date) {
    final DateFormat dateDateFormat = DateFormat.yMMMMEEEEd(_localeName);
    final String dateString = dateDateFormat.format(date);

    String helloWorldOn(Object date) {
      return Intl.message(
        'Hello World on ${date}',
        locale: _localeName,
        name: 'helloWorldOn',
        desc: 'A message with a date parameter',
        args: <Object>[date]
      );
    }
    return helloWorldOn(dateString);
  }

  String helloWorldPopulation(int count, int population) {
    final NumberFormat populationNumberFormat = NumberFormat.compactLong(
      locale: _localeName,
    );
    final String populationString = populationNumberFormat.format(population);

    String helloWorldPopulation(int count, Object population) {
      return Intl.plural(
        count,
      locale: _localeName,
      name: 'helloWorldPopulation',
      desc: 'A plural message with an additional integer parameter',
      args: <Object>[count, population],
      one: 'Hello World of ${populationString} citizens',
      two: 'Hello two worlds with ${populationString} total citizens',
      many: 'Hello all ${count} worlds, with a total of ${populationString} citizens',
      other: 'Hello other ${count} worlds, with a total of ${populationString} citizens'
      );
    }
    return helloWorldPopulation(count, populationString);
  }

  String helloWorlds(int count) {
    return Intl.plural(
      count,
      locale: _localeName,
      name: 'helloWorlds',
      desc: 'A plural message',
      args: <Object>[count],
      zero: 'Hello',
      one: 'Hello World',
      two: 'Hello two worlds',
      few: 'Hello ${count} worlds',
      many: 'Hello all ${count} worlds',
      other: 'Hello other ${count} worlds'
    );
  }

  String helloWorldsInterpolation(int count, Object hello, Object world) {
    return Intl.plural(
      count,
      locale: _localeName,
      name: 'helloWorldsInterpolation',
      desc: 'A plural message with parameters that need string interpolation braces',
      args: <Object>[count, hello, world]
    );
  }

  String helloWorldsOn(int count, DateTime date) {
    final DateFormat dateDateFormat = DateFormat.yMMMMEEEEd(_localeName);
    final String dateString = dateDateFormat.format(date);

    String helloWorldsOn(int count, Object date) {
      return Intl.plural(
        count,
      locale: _localeName,
      name: 'helloWorldsOn',
      desc: 'A plural message with an additional date parameter',
      args: <Object>[count, date],
      zero: 'Hello on ${dateString}',
      one: 'Hello World, on ${dateString}',
      two: 'Hello two worlds, on ${dateString}',
      other: 'Hello other ${count} worlds, on ${dateString}'
      );
    }
    return helloWorldsOn(count, dateString);
  }

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
