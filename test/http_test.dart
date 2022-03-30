
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {

    // var httpClient = new HttpClient();
    // var uri = new Uri.https(
    //     'api.cnblogs.com', 'token', {
    //   "client_id": "39163b8a-6bc6-4d0c-b21e-760cd28c84c6",
    //   "client_secret": "IPIP93MZr-cvtjiFcgsratwJt82xkkStXU8Tm9Gcj-6qk4KnRiLMmlh2ljgRk0VT6iJC4ZXzkAWPzFTU",
    //   "grant_type": "client_credentials"
    // });
    // var request = await httpClient.postUrl(uri);
    // var response = await request.close();
    // var responseBody = await response.transform(utf8.decoder).join();
    // print(responseBody);

  //1 Client_Credentials授权
  var client = http.Client();
  var data = {
    "client_id": "39163b8a-6bc6-4d0c-b21e-760cd28c84c6",
    "client_secret": "IPIP93MZr-cvtjiFcgsratwJt82xkkStXU8Tm9Gcj-6qk4KnRiLMmlh2ljgRk0VT6iJC4ZXzkAWPzFTU",
    "grant_type": "client_credentials"
  };
  var url = Uri.https('api.cnblogs.com', 'token');
  var response = await client.post(url, body: data);
  print("====>" + response.body);

  //

}
