import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Future<List<Map<String, String>>> fetchNotices() async {
  final url = Uri.parse('https://iost.tu.edu.np/notices');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    Document document = parse(response.body);
    final noticeElements = document.querySelectorAll('.view-content .views-row');

    List<Map<String, String>> notices = [];

    for (var element in noticeElements) {
      final title = element.querySelector('h3 a')?.text ?? 'No title';
      final link = element.querySelector('h3 a')?.attributes['href'] ?? '#';

      notices.add({
        'title': title,
        'link': 'https://iost.tu.edu.np$link',
      });
    }

    return notices;
  } else {
    throw Exception('Failed to load notices');
  }
}
