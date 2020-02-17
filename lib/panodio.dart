import 'tts.dart';

class Panodio {
  String command;
  Tts tts = new Tts();

  Panodio({this.command}) {
    tts.speak(command);
  }
}
