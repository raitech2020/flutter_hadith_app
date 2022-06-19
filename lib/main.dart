import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/hadith_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var hadithBrain = HadithBrain();

void main() {
  runApp(const HadithApp());
}

class HadithApp extends StatelessWidget {
  const HadithApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade500,
        appBar: AppBar(
          title: const Text('RAI Hadith Collection'),
          backgroundColor: Colors.pink,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HadithPage(),
          ),
        ),
      ),
    );
  }
}

class HadithPage extends StatefulWidget {
  const HadithPage({Key? key}) : super(key: key);

  @override
  HadithPageState createState() => HadithPageState();
}

class HadithPageState extends State<HadithPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                hadithBrain.getHadithText(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  hadithBrain.nextHadith();
                  if (hadithBrain.isOutOfBound()) {
                    _upperOutOfBoundAlert(context);
                    hadithBrain.reset();
                  }
                });
              },
              child: const Text(
                'Forward',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  hadithBrain.previousHadith();
                  if (hadithBrain.isOutOfBound()) {
                    _lowerOutOfBoundAlert(context);
                    hadithBrain.reset();
                  }
                });
              },
              child: const Text(
                'Backward',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              '${hadithBrain.getCurrHadith() + 1}/${hadithBrain.getNumberOfHadiths()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_upperOutOfBoundAlert(context) {
  Alert(
    context: context,
    title: "End of Hadith Collection",
    desc: "Can't go beyond the last Hadith.",
    alertAnimation: fadeAlertAnimation,
  ).show();
}

_lowerOutOfBoundAlert(context) {
  Alert(
    context: context,
    title: "Start of Hadith Collection",
    desc: "Can't go back beyond the first Hadith.",
    alertAnimation: fadeAlertAnimation,
  ).show();
}

// The easiest way for creating RFlutter Alert
_onBasicAlertPressed(context) {
  Alert(
    context: context,
    title: "ALERT Dialog",
    desc: "Flutter is more awesome with RFlutter Alert.",
  ).show();
}

//Custom animation alert
_onCustomAnimationAlertPressed(context) {
  Alert(
    context: context,
    title: "ALERT Dialog",
    desc: "Flutter is more awesome with RFlutter Alert.",
    alertAnimation: fadeAlertAnimation,
  ).show();
}

Widget fadeAlertAnimation(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return Align(
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text('Alert Dialog'),
    content: const Text('You have seen all the hadiths.'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
