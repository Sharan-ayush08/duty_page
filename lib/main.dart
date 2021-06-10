import 'package:duty_page/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeinput2 = TextEditingController();

  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.amber];

  // get DateFormat => null;

  @override
  void initState() {
    timeinput.text = "";
    timeinput2.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          title: Text("Duty"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    height: double.infinity,
                    child: Icon(Icons.edit),
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Up to 20", border: InputBorder.none),
                  ),
                  trailing: Container(
                    height: 40.0,
                    width: 60.0,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Color",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SubscriptionFilter(),
                Divider(
                  height: 30,
                  indent: 10,
                  thickness: 1,
                ),
                Center(child: Text("ABBREVIATION")),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    elevation: 5,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextFormField(
                        decoration: InputDecoration(),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 30,
                  indent: 10,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Expanded(
                          child: Icon(Icons.merge_type_outlined),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Type",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 45,
                        width: 85,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("work"),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 45,
                        width: 85,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("off"),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 45,
                        width: 85,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("vac"),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 45,
                        width: 85,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("half"),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                  indent: 10,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.timer),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Schedule",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: SizedBox(
                        width: 75.0,
                        child: Container(
                          child: GestureDetector(
                            child: Builder(builder: (context) {
                              return TextFormField(
                                controller: timeinput,
                                decoration: InputDecoration(
                                    labelText: "START",
                                    hintText: "Time",
                                    border: InputBorder.none),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    print(pickedTime.format(context));
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    print(parsedTime);
                                    String formattedTime =
                                        DateFormat('hh:mm').format(parsedTime);
                                    print(formattedTime);
                                    setState(() {
                                      timeinput.text = formattedTime;
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 10.0,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: SizedBox(
                        width: 75.0,
                        child: Container(
                          child: GestureDetector(
                            child: Builder(builder: (context) {
                              return TextFormField(
                                controller: timeinput2,
                                decoration: InputDecoration(
                                    labelText: "END",
                                    hintText: "Time",
                                    border: InputBorder.none),
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    print(pickedTime.format(context));
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    print(parsedTime);
                                    String formattedTime =
                                        DateFormat('hh:mm').format(parsedTime);
                                    print(formattedTime);
                                    setState(() {
                                      timeinput2.text = formattedTime;
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
