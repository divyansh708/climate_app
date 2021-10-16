import 'package:http/http.dart' as http;
import 'dart:convert';

class GetData {

  GetData(this.url);
  final String url;

  Future getData() async {
    var parsedurl = Uri.parse(url);
    http.Response response = await http.get(parsedurl);
    if(response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    }else{
      return response.statusCode;
    }
  }

}