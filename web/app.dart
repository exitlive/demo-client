import 'dart:html';

import 'package:iris/client/browser_http_client.dart';


import 'package:exitlive_demo_server/generated/iris/services.dart';
import 'package:exitlive_demo_server/generated/proto/messages.dart';




/// Configures the http client to communicate with the server
HttpIrisClient client = new HttpIrisClient(Uri.parse("http://localhost:8088"));

/// Creates a configure iris services instance.
/// This object holds all services, which are collection of remote procedures
Services services = new Services(client);


void main() {

  // Setup the click event for the uppercase button
  querySelector('button#to-uppercase')
      .onClick.listen((_) => convertToUpperCase());

}



/**
 * Reads the text from the input field, and calls the
 * remote procedure on the server to transform the text.
 */
convertToUpperCase() {

  // Get the input element
  InputElement input = querySelector('input');

  // And its value.
  var requestMessage = new TextToUpperCaseRequest()
      ..text = input.value;
      // Notice how the Dart editor *knows* that `.value`
      // is a proper attribute of an [InputElement].

  // Call the remote procedure on the `textService`.
  services.textService.convertToUpperCase(requestMessage)
      .then((UpperCaseText response) {
        // Write the response to our <pre></pre> element.

        // Notice that the response is an instance of `UppercaseText`
        // that has already been validated and supports code
        // completion.
        querySelector('#output').innerHtml += 'Response: ${response.text}\n';
      });

}