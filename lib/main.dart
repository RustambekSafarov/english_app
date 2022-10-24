import 'package:flutter/material.dart';
import 'package:english_app/check.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data = {
    'data': [
      {'question': 'name (plural) ?', 'answer': 'plurals'},
      {'question': 'name (plura) ?', 'answer': 'pluras'},
      {'question': 'name (plur) ?', 'answer': 'plurs'}
    ]
  };
  TextEditingController controller = TextEditingController(text: '');
  bool correct = false;
  int idx = 0;
  bool change = false;
  List<Widget> Checklist = [];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data['data'][idx]['question'],
            style: TextStyle(fontSize: 18),
          ),
          Card(
            child: Container(
              width: 327,
              height: 56,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    String text = controller.text;
                    correct = text == data['data'][idx]['answer'];
                    Checklist.add(Card(
                      child: Text(
                        "${data['data'][idx]['answer']}: $correct",
                        style: TextStyle(fontSize: 18),
                      ),
                    ));
                    idx = idx >= data['data'].length ? idx + 1 : 0;
                    // idx++;
                    controller.text = '';
                  });
                },
                child: Text('Submit',style: GoogleFonts.inter(),),
              ),
            ],
          ),
          correct ? Text('good') : Text(''),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Test(
                      checklist: Checklist,
                    ),
                  ));
            },
            child: Text(
              'next',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    ));
  }
}
