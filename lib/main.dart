//import 'package:flutter/gestures.dart';
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
  TextEditingController abb = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeinput2 = TextEditingController();
  int currentColor = 0;
  bool _hasBeenPressed = true;
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;

  final List<Color> colors = <Color>[
    Color(0xFFEF9A9A),
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.red,
    Colors.brown,
  ];

  // get DateFormat => null;

  @override
  void initState() {
    timeinput.text = "";
    timeinput2.text = "";
    super.initState();
  }

  @override
  void dispose() {
    abb.dispose();
    super.dispose();
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
                        labelText: "Duty Name", border: InputBorder.none),
                  ),
                  trailing: Container(
                    height: 40.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors[currentColor],
                    ),
                    child: Center(
                      child: Text(
                        // ignore: unnecessary_null_comparison
                        (abb.text.toString() == null ||
                                abb.text.toString().length == 0)
                            ? 'DUTY'
                            : abb.text.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: Container(
                          margin: currentColor == index
                              ? EdgeInsets.fromLTRB(3, 0, 3, 0)
                              : EdgeInsets.fromLTRB(6, 5, 6, 5),

                          // height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: currentColor == index
                                    ? colors[index]
                                    : Colors.transparent,
                                width: 4),
                            color: colors[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  height: 30,
                  indent: 10,
                  thickness: 1,
                ),
                // Center(child: Text("ABBREVIATION")),
                ListTile(
                  leading: Container(
                    height: double.infinity,
                    child: Icon(Icons.switch_camera),
                  ),
                  title: TextFormField(
                    controller: abb,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: "ABBREVIATION", border: InputBorder.none),
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
                        child: Icon(Icons.merge_type_outlined),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      RaisedButton(
                        textColor: Colors.black,
                        child: Text("work"),
                        color: _hasBeenPressed ? Colors.blue : Colors.white,
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed = !_hasBeenPressed;
                            _hasBeenPressed1 = false;
                            _hasBeenPressed2 = false;
                            _hasBeenPressed3 = false;
                          });
                        },
                      ),

                      // ignore: deprecated_member_use
                      RaisedButton(
                        textColor: Colors.black,
                        child: Text("off"),
                        color: _hasBeenPressed1 ? Colors.blue : Colors.white,
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed1 = !_hasBeenPressed1;
                            _hasBeenPressed = false;
                            _hasBeenPressed2 = false;
                            _hasBeenPressed3 = false;
                          });
                        },
                      ),

                      // ignore: deprecated_member_use
                      RaisedButton(
                        textColor: Colors.black,
                        child: Text("vac"),
                        color: _hasBeenPressed2 ? Colors.blue : Colors.white,
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed2 = !_hasBeenPressed2;
                            _hasBeenPressed = false;
                            _hasBeenPressed1 = false;
                            _hasBeenPressed3 = false;
                          });
                        },
                      ),

                      //ignore: deprecated_member_use
                      RaisedButton(
                        textColor: Colors.black,
                        child: Text("half"),
                        color: _hasBeenPressed3 ? Colors.blue : Colors.white,
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed3 = !_hasBeenPressed3;
                            _hasBeenPressed = false;
                            _hasBeenPressed1 = false;
                            _hasBeenPressed2 = false;
                          });
                        },
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
                      padding: const EdgeInsets.only(left: 75.0),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text("___"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
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
