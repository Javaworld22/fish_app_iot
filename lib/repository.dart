import 'package:dio/dio.dart';

class Repository  {
  static String baseURL =  'https://api.thingspeak.com/channels/2824091/';

  static Future<Response> fields() {
    var url =
        baseURL+'fields/1.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  static Future<Response> field2() {
    var url =
        baseURL+'fields/2.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  static Future<Response> field3() {
    var url =
        baseURL+'fields/3.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  static Future<Response> field4() {
    var url =
        baseURL+'fields/4.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  static Future<Response> field5() {
    var url =
        baseURL+'fields/5.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  static Future<Response> field6() {
    var url =
        baseURL+'fields/6.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  static Future<Response> field8() {
    var url =
        baseURL+'fields/8.json?results=10';
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }
}