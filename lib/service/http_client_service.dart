import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class HttpClientService{
  static const String _baseUrl ="api.api-ninjas.com";
  static const String baseApi ="v1/nutrition";
  static const String baseApiPost ="todo";
  static const String _baseUrlMockApi ="https://65c717aae7c384aada6e2dae.mockapi.io";

  /// api.api-ninjas.com/v1/nutrition
  /// 65c717aae7c384aada6e2dae.mockapi.io/todo


  static Future<String?> getData({required String api, required Map<String, String> param}) async {
    HttpClient httpClient = HttpClient();
    // Uri url = Uri.parse("$_baseUrl/$api");
    // log(url.toString());
     Uri uri = Uri.http(_baseUrl,"/$api", param);
     log(uri.toString());
     HttpClientRequest request = await httpClient.getUrl(uri);
     request.headers.set('X-Api-Key', 'n9Q2Rw3jvtqd2zIskqjSnQ==VaVRlsKdBASzv2eM');
     HttpClientResponse response = await request.close();
    log(response.statusCode.toString());
    if (response.statusCode == HttpStatus.ok) {
      String result = await response.transform(utf8.decoder).join();
      log("message");
      log(result.toString());
      httpClient.close();
      return result;
    } else {
      httpClient.close();
      throw Exception('Failed to load data');
    }
  }

  static Future<String?> getData2({required String api}) async {
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("$_baseUrlMockApi/$api");
    log("Mock APi  $url");
    log(url.toString());
    HttpClientRequest request = await httpClient.getUrl(url);
    HttpClientResponse response = await request.close();
    log(response.statusCode.toString());
    if (response.statusCode == HttpStatus.ok) {
      String result = await response.transform(utf8.decoder).join();
      log("message");
      log(result.toString());
      httpClient.close();
      return result;
    } else {
      httpClient.close();
      throw Exception('Failed to load data');
    }
  }

  static Future<String?> postData({ required String api, required Map<String, dynamic> data})async{
    HttpClient httpClient = HttpClient();
    Uri url = Uri.parse("$_baseUrlMockApi/$api");
    log("${url}         Mock Api Url");
    HttpClientRequest request = await httpClient.postUrl(url);
    request.headers.set('Content-Type', 'application/json');
    request.add(utf8.encode(jsonEncode(data)));
    HttpClientResponse response = await request.close();
    if(response.statusCode == HttpStatus.created){
      log("successfully posted in HTTPClient Service");
      String result = await response.transform(utf8.decoder).join();
      httpClient.close();
      return result;
    }else{
      log("HttpClient serviceda post funksiyasi ishlamadi null qaytti");
      return null;
    }
  }

  // static Future<String?> putData({required String api, required Map<String, Object?> data}) async {
  //   HttpClient httpClient = HttpClient();
  //   Uri url = Uri.parse('$_baseUrl/$api');
  //   HttpClientRequest request = await httpClient.putUrl(url);
  //   request.headers.set('X-Api-Key', 'n9Q2Rw3jvtqd2zIskqjSnQ==VaVRlsKdBASzv2eM');
  //   request.add(utf8.encode(jsonEncode(data)));
  //   HttpClientResponse response = await request.close();
  //   if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
  //     String responseBody = await response.transform(utf8.decoder).join();
  //     httpClient.close();
  //     return responseBody;
  //   } else {
  //     httpClient.close();
  //     throw Exception('Failed to load data');
  //   }
  // }
  //
  static Future<String?> deleteData({required String api, required String id}) async {
    HttpClient httpClient = HttpClient();
    try {
      Uri url = Uri.parse('$_baseUrlMockApi/$api/$id');
      log(url.toString());
      HttpClientRequest request = await httpClient.deleteUrl(url);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == HttpStatus.noContent || response.statusCode == HttpStatus.ok) {
        return responseBody;
      } else {
        throw Exception('Failed to delete resource: ${response.statusCode}, $responseBody');
      }
    } finally {
      httpClient.close();
    }
  }

}