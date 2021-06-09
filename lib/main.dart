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
        body: SafeArea(
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
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey, onPrimary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Color",
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 80,
                      color: Colors.green,
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      color: Colors.black,
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      color: Colors.lightGreen,
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      color: Colors.orange,
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
                      child: Expanded(
                        child: Icon(Icons.merge_type_outlined),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Expanded(
                        child: Text(
                          "Type",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 195.0),
                      child: Expanded(child: Text("Work")),
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(Icons.search),
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                      ),
                    )
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
                      child: Expanded(
                        child: Icon(Icons.timer),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Expanded(
                        child: Text("Time"),
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
                                  hintText: "Time", border: InputBorder.none),
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
                                  hintText: "Time", border: InputBorder.none),
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
    );
  }
}
