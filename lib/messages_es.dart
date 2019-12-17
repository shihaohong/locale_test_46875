import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "hello" : MessageLookupByLibrary.simpleMessage("Hola"),
    "title" : MessageLookupByLibrary.simpleMessage("App Hola Mundo")
  };
}