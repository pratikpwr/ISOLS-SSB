import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebScreen extends StatefulWidget {
  final String url;

  WebScreen(this.url);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  String webUrl = 'https://school.howtocrackssb.com/';

  bool isLoading = true;

  final _key = UniqueKey();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future<bool> _willPopCallback() async {
    WebViewController webViewController = await _controller.future;
    bool canNavigate = await webViewController.canGoBack();
    if (canNavigate) {
      webViewController.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff2b3636),
        child: Icon(Icons.arrow_back),
        onPressed: () {
          _willPopCallback();
        },
      ),
      body: SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Stack(
            children: [
              WebView(
                key: _key,
                initialUrl: widget.url ?? webUrl,
                navigationDelegate: (NavigationRequest request) {
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                javascriptChannels: <JavascriptChannel>[
                  _toasterJavascriptChannel(context),
                ].toSet(),
                onPageStarted: (String url) {
                  setState(() {
                    isLoading = true;
                  });
                },
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
                gestureNavigationEnabled: true,
              ),
              isLoading
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xff2b3636)),
                        ),
                      ),
                    )
                  : Stack(),
            ],
          );
        }),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
