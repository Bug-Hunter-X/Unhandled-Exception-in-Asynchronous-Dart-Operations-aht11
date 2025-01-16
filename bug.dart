```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Process the data successfully
      final jsonData = jsonDecode(response.body);
      // Use jsonData
    } else {
      // Handle error: wrong status code
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle error: network error or other exceptions
    print('Error: $e');
    //Rethrow the exception to be handled at a higher level if necessary.
    rethrow;
  }
}
```