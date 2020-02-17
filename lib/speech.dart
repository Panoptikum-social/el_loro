import 'package:speech_to_text/speech_to_text.dart';
import 'panodio.dart';

class Speech {
  var speech = SpeechToText();

  Speech() : super();

  Future<String> listen() async {
    String text;

    bool available = await speech.initialize(
      onError: (error) => print("Error: ${error.toString()}"),
    );

    if (available) {
      speech.listen(
        onResult: (result) async {
          if (result.finalResult == true) {
            Panodio(command: result.recognizedWords);
            text = result.recognizedWords;
          }
        },
        listenFor: Duration(seconds: 5),
        localeId: "es_ES",
      );
      await Future.delayed(Duration(seconds: 5), () => {});
      return text ?? "No te entiendo!";
    } else {
      return "Error: Access to Microphone denied";
    }
  }
}
