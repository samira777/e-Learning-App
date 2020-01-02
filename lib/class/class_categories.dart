
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_post_req/ui/model_categories.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';












class class_categories{

  static List<int> arr_categoties_id;

  class_categories()
  {
    arr_categoties_id = [1, 2];
    arr_categoties_id.length = 0;
  }

  Future <List<Categories>> getjson_categories() async {
    String username = 'WbZeLLUbfHIGAuxweqRMuPv9rBwxBvKyHJMsuHEK';
    String password = 'omqYRXu5omSScn1DZybB4V9MFWeaDTU1fk07ivcG';

    var body = {'username': 'admin', 'password': 'yogendrapal'};

    String basicAuth =
        'Basic '+ base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await http.post('http://eduapp.ml/wp-json/jwt-auth/v1/token',
        headers:{
          //"Content-type": "application/x-www-form-urlencoded",
          /*"Authorization":basicAuth*/}, body: body );
    print('${response.statusCode}');
    print('${response.body}');
    var data = json.decode(response.body)['token'];
    writeData_categories_token(data);
    String dataread = await readData_categories_token();
    print(dataread);

    final response1 = await http.get('http://eduapp.ml/wp-json/wp/v2/categories',
      headers:{
        "Content-type": "application/json",
        "Authorization":'Bearer '+dataread }  );
    print('${response1.body}');


      var data_categories = categoriesFromJson(response1.body) ;
      data_categories.forEach((n){
        arr_categoties_id.add(n.id);
      });

      writeData_categories(arr_categoties_id.toString());


    return categoriesFromJson(response1.body);


  }


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory(); //home/directory/:text
    return directory.path; //home//directory/

  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/data_categories_token.txt'); //home/directory/data.txt
  }

//write and read from file
  Future<File> writeData_categories_token(String message) async {
    final file = await _localFile;
    //write to file
    return file.writeAsString('$message');
  }

  Future<String> readData_categories_token() async {
    try {
      final file = await _localFile;
      //read
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return "nothing saved yet";
    }
  }

  Future<File> get _localFile_categories async {
    final path = await _localPath;
    return new File('$path/data_categories.txt'); //home/directory/data.txt
  }

//write and read from file
  Future<File> writeData_categories(String message) async {
    final file = await _localFile_categories;
    //write to file
    return file.writeAsString('$message');
  }

  Future<String> readData_categories() async {
    try {
      final file = await _localFile_categories;
      //read
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return "nothing saved yet";
    }
  }




}