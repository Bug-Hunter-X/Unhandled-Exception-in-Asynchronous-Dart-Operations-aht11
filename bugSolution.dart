```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetchException implements Exception {
  final String message;
  DataFetchException(this.message);
  @override
  String toString() => message;
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Use jsonData
    } else {
      throw DataFetchException('Failed to load data: ${response.statusCode}');
    }
  } on DataFetchException catch (e) {
    print('Data Fetch Error: $e');
    //Handle error appropriately in the context of the application.
  } catch (e) {
    print('Unexpected Error: $e');
    // Log error to a service such as Sentry for more advanced error tracking
  }
}
```