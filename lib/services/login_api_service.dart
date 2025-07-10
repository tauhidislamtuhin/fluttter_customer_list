import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginApiService {
  static const String baseUrl = 'https://www.pqstec.com/InvoiceApps/Values';

  Future<String?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/LogIn?UserName=$username&Password=$password&ComId=1');
    print("url check : $url");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['Token'] != null) {
        final jt = json['Token'];
        print("json body $jt");
        return json['Token']; // Return Bearer token
      }
    }

    return null;
  }
}

