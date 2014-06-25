import 'dart:html';

import 'package:iris/client/browser_http_client.dart';


import 'package:exitlive_demo_server/generated/iris/services.dart';
import 'package:exitlive_demo_server/generated/proto/messages.dart';


HttpIrisClient client = new HttpIrisClient(Uri.parse("http://localhost:8088"));

Services services = new Services(client);


void main() {

  querySelector('button').onClick.listen((_) => convertToUppercase());

}



convertToUppercase() {

  InputElement input = querySelector('input');
  var requestMessage = new TextToUppercaseRequest()
      ..text = input.value;

  services.textService.convertToUppercase(requestMessage)
      .then((UppercaseText response) {
        querySelector('pre').innerHtml += 'Response from server: ${response.text}\n';
      });

}