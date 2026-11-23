import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HomeRepository {
  static Future<List> getLaptops() async {
    try {
      final response = await http.get(
        Uri.parse("https://6b04308e9e7cafb37dc008f8.mockapi.io/laptops"),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // * Success
        return json.decode(response.body);
      } else {
        throw HttpException(response.body);
      }
    } on TimeoutException catch (_) {
      throw TimeoutException(
        "Slow internet connection try again with differnt network",
      );
    } on SocketException catch (_) {
      throw SocketException(
        "Check your connection and try again dont use ucell",
      );
    } catch (e) {
      throw Exception('Something went wrong !');
    }
  }
}
