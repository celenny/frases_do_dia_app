import 'package:frases_do_dia/src/data/repository/quote/quote_repository.dart';
import 'package:frases_do_dia/src/domain/quote_model.dart';

class QuoteService {
  Future<QuoteModel> find() async {
    final repo = QuoteRepository();
    return repo
        .findQuote()
        .then((quote) => QuoteModel(id: quote.id, text: quote.text));
  }
}
