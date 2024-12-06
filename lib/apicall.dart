import 'dart:convert';

import 'package:http/http.dart' as http;

class Apicall {
  getproducts() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    print(response.body);

    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body);
      return temp["products"];
    } else {
      throw Exception('error');
    }

  


    }
  }


Apicall apicall = Apicall();