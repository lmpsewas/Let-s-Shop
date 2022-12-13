import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping_app/api_modal.dart';
const productsAPIURL =
    'https://pstest.knowband.com/ps177/demo5/?fc=module&module=kbmobileapp&controller=ApiCall&version=2.0&route=appGetCategoryDetails&iso_code=en';
var url = Uri.parse(productsAPIURL);

class ProductList {
  Future<AutoGenerate?> productData() async{
  var response = await http.post(url, body: {
  'page_number': '1',
  'item_count': '20',
  'filter': '{}',
  'category_id': '3',
  'search_term': '',
  'iso_code': 'en',
  'id_currency': '1',
  'session_data': '',
  'email': ''
  });

  if(response.statusCode == 200){
    var decodedData = jsonDecode(response.body);
    return AutoGenerate.fromJson(decodedData);
  }
  else{
    return null;
  }

}}

