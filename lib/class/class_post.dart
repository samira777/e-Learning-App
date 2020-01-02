
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:http_post_req/ui/model.dart';
import 'package:path_provider/path_provider.dart';












class class_post{


  Future <Welcome> getjson(String post_url) async {
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
    writeData(data);
    String dataread = await readData();
    print(dataread);

    final response1 = await http.post('$post_url',
      headers:{
        "Content-type": "application/json",
        "Authorization":'Bearer '+dataread },/*body: 'title:yes'*/  );
    print('${response1.body}');

    //Cookie cookie = new Cookie();
    //cookie.value = data;
    //print(cookie.value);
    return welcomeFromJson(response1.body);


  }


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory(); //home/directory/:text
    return directory.path; //home//directory/

  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/data1.txt'); //home/directory/data.txt
  }

//write and read from file
  Future<File> writeData(String message) async {
    final file = await _localFile;
    //write to file
    return file.writeAsString('$message');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      //read
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return "nothing saved yet";
    }
  }




}