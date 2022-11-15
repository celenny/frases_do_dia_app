import 'package:http/http.dart';

class QuoteEntity {
  final int id;
  final String text;

  const QuoteEntity({required this.id, required this.text});

  factory QuoteEntity.fromJson(Map<String, dynamic> json) {
    return QuoteEntity(id: json['id'], text: json['text']);
  }
}
