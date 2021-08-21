import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  get title => Text("HNG User App");

  get someText => Text("Here Goes Your Input.......");

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController clearCtrl = new TextEditingController();
  String value = "";
  var defaultText = TextStyle(color: Colors.black);
  var linkText = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: widget.title,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            widget.someText,
            SizedBox(
              height: 25.0,
            ),
            TextField(
              controller: clearCtrl,
              decoration:
              InputDecoration.collapsed(hintText: "TYPE SOMETHING....."),
              style: TextStyle(fontSize: 20),
              onChanged: (String text) {
                setState(() {
                  value = text;
                });
              },
              onSubmitted: (String text) {
                setState(() {
                  value = clearCtrl.text;
                });
                clearCtrl.clear();
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            Column(
              children: <Widget>[
                new Text(
                  "\n\n $value",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Image.asset('assets/images/brand-logo.png'),
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: defaultText,
                        text: "To learn More?",
                      ),
                      TextSpan(
                        style: linkText,
                        text: " Click Here",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://hng.tech/');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
