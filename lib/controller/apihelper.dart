

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  String urlData="https://fakestoreapi.com/products?_gl=1*1pe1i8v*_ga*MTQyMDU4ODc2Mi4xNzE0MTE2NDUw*_ga_ZCYG64C7PL*MTcyMzAxNDc2Mi4xMC4xLjE3MjMwMTU4NzEuMC4wLjA.";
  Future apiCalling()
  async {
    Uri url = Uri.parse(urlData);
    Response response= await http.get(url);
    if(response.statusCode==200)
      {
        final json= jsonDecode(response.body);
        return json;
      }
    else{
      return [];
    }

  }
}