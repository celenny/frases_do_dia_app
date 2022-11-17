import 'package:frases_do_dia/src/application/service/quote_service.dart';
import 'package:rx_notifier/rx_notifier.dart';

class QuoteController {
  final _result =
      RxNotifier<String>('Olá, gostaria de uma frase? Clique no botão');
  String get result => _result.value;

  void find() {
    _result.value = '';
    QuoteService()
        .find()
        .then((quote) => _result.value = quote.text)
        .onError((error, stackTrace) => _result.value = error.toString());
  }
}
