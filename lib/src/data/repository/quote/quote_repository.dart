import 'package:frases_do_dia/src/data/entity/quote_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

class QuoteRepository {
  Future<QuoteEntity> findQuote() async {
    developer.log('log me', name: 'my.app.category');

    final response = await http.get(Uri.parse(
        'https://4pjrs07zi1.execute-api.us-east-1.amazonaws.com/v1/quote'));

    if (response.statusCode == 200) {
      developer.log('log me1', name: 'my.app.category');
      return QuoteEntity.fromJson(jsonDecode(response.body));
    } else {
      developer.log('log me2', name: 'my.app.category');
      throw Exception(
          'Desculpe-me, mas não consegui uma frase para você nesse momento.');
    }
  }
}
