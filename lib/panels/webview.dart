import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class View extends StatefulWidget {

  String url;
  View(this.url);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  bool isLoading = true;
  late  String finalUrl = widget.url.toString();
  final Completer<WebViewController> controller = Completer<WebViewController>();
 // @override
 //  void initState() {
 //    if(widget.url.toString().contains("http://"))
 //    {
 //      finalUrl = widget.url.toString().replaceAll("http://", "https://");
 //    }
 //    else{
 //      finalUrl = widget.url;
 //    }
 //    super.initState();
 //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 UPDATE"),
        centerTitle: true,
      ),
      body: Stack(
        children:  [
          WebView(
            initialUrl: finalUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish){
              setState(() {
                isLoading = false;
              });
            },
            // onWebViewCreated: (WebViewController webViewController){
            //   setState(() {
            //     controller.complete(webViewController);
            //   });
            // },

          ),
          isLoading ? Center(child: CircularProgressIndicator(),) : Stack(),
        ],
      ),
    );
  }
}
