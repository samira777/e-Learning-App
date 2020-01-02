import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class class_logs {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory(); //home/directory/:text
    return directory.path; //home//directory/

  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/log1.txt'); //home/directory/data.txt
  }

//write and read from file
  Future<File> writeData_logs(String message) async {
    final file = await _localFile;
    //write to file
    return file.writeAsString('$message');
  }

  Future<String> readData_logs() async {
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