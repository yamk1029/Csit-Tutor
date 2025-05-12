import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<List<Map<String, String>>> fetchNotices() async {
  final response = await http.get(Uri.parse('https://iost.tu.edu.np/notices'));

  if (response.statusCode == 200) {
    final document = parse(response.body);
    final noticeElements = document.querySelectorAll(
      '.view-content .notice-item a',
    );

    final notices =
        noticeElements.map((element) {
          final title = element.text.trim();
          final href = element.attributes['href'];
          final link = Uri.parse('https://iost.tu.edu.np$href').toString();
          return {'title': title, 'link': link};
        }).toList();

    return notices;
  } else {
    throw Exception('Failed to load notices');
  }
}
