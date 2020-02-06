// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(hello, world) => "${hello} ${world}";

  static m1(world) => "Hello ${world}";

  static m2(count, adjective) => "${Intl.plural(count, zero: 'Hello', one: 'Hello ${adjective} World', two: 'Hello two ${adjective} worlds', other: 'Hello other ${count} ${adjective} worlds')}";

  static m3(price, value) => "Hello for ${price} ${value}";

  static m4(value) => "Hello for ${value}";

  static m5(world, date, time) => "Hello ${world} on ${date} at ${time}";

  static m6(startDate, endDate) => "Hello World from ${startDate} to ${endDate}";

  static m7(hello, world) => "[${hello}] #${world}#";

  static m8(date) => "Hello World on ${date}";

  static m9(count) => "${Intl.plural(count, zero: 'Hello', one: 'Hello World', two: 'Hello two worlds', few: 'Hello ${count} worlds', many: 'Hello all ${count} worlds', other: 'Hello other ${count} worlds')}";

  static m10(count, hello, world) => "${Intl.plural(count, other: '[${hello}] -${world}- #${count}#')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "greeting" : m0,
    "hello" : m1,
    "helloAdjectiveWorlds" : m2,
    "helloCost" : m3,
    "helloFor" : m4,
    "helloOn" : m5,
    "helloWorld" : MessageLookupByLibrary.simpleMessage("Hello World"),
    "helloWorldDuring" : m6,
    "helloWorldInterpolation" : m7,
    "helloWorldOn" : m8,
    "helloWorlds" : m9,
    "helloWorldsInterpolation" : m10
  };
}
