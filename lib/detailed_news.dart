import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types
class detailed_news extends StatefulWidget {
  detailed_news({this.url, this.toggle});
  final String url;
  final toggle;
  @override
  _detailed_newsState createState() => _detailed_newsState();
}

// ignore: camel_case_types
class _detailed_newsState extends State<detailed_news> {
  final Completer<WebViewController> cont = Completer<WebViewController>();
  bool loading = true;
  bool t = false;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    await widget.toggle;
    t = widget.toggle;
    print("t$t");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            backgroundColor: t ? Colors.white : Color(0xff212121),
            body: Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ))
        : Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: t ? Colors.black : Colors.white,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "News",
                    style: TextStyle(
                        color: t ? Color(0xff212121) : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "opedia",
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: <Widget>[
                Opacity(
                  opacity: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.save),
                  ),
                )
              ],
              backgroundColor: t ? Colors.white : Color(0xff212121),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: widget.url,
                onWebViewCreated: ((WebViewController webviewController) {
                  cont.complete(webviewController);
                }),
                javascriptMode: JavascriptMode.disabled,
              ),
            ),
          );
  }
}
