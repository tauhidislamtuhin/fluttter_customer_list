import 'dart:convert';
import 'package:customer_list/models/customer_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class CustomerApiService {
 Future<CustomerListResponse?> fetchCustomerList(int pageNo) async {
    final prefs = await SharedPreferences.getInstance();
    final String? bearerToken = prefs.getString('auth_token');
    final url =
        'https://www.pqstec.com/InvoiceApps/Values/GetCustomerList?searchquery=&pageNo=$pageNo&pageSize=20&SortyBy=Balance';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {

        return CustomerListResponse.fromJson(json.decode(response.body));
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }

    return null;
  }

}
