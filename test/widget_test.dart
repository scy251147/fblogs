
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fblogs/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });



  testWidgets("1.client_credentials",  (WidgetTester tester) async {
    // var client = http.Client();
    // var data = {
    //   "client_id": "39163b8a-6bc6-4d0c-b21e-760cd28c84c6",
    //   "client_secret": "IPIP93MZr-cvtjiFcgsratwJt82xkkStXU8Tm9Gcj-6qk4KnRiLMmlh2ljgRk0VT6iJC4ZXzkAWPzFTU",
    //   "grant_type": "client_credentials"
    // };
    // var url = Uri.https('api.cnblogs.com', 'token');
    // var response = await client.post(url, body: data);
    // print("====>" + response.body);


    var httpClient = new HttpClient();
    var uri = new Uri.https(
        'api.cnblogs.com', '/token', {
          "client_id": "39163b8a-6bc6-4d0c-b21e-760cd28c84c6",
          "client_secret": "IPIP93MZr-cvtjiFcgsratwJt82xkkStXU8Tm9Gcj-6qk4KnRiLMmlh2ljgRk0VT6iJC4ZXzkAWPzFTU",
          "grant_type": "client_credentials"
        });
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    print(responseBody);




  });


}
