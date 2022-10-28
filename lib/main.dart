// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tp_28oct/Dog.dart';
import './FakeDogDatabase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
            list(),
    );
  }
}

Widget list() {
  return ListView.builder(
    itemCount: dogList.length,
    itemBuilder: (context, index) {
                    return GestureDetector(
                child: card(dogList[index]),
                onTap: () => print(dogList[index].name),
              );
    },
    padding: const EdgeInsets.only(bottom: 20),
    // on item click
  );
}

Widget card(Dog dog) {
  return Container(
      padding: EdgeInsets.all(2),
      height: 150,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            //set border radius more than 50% of height and width to make circle
          ),
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClipRRect(
                      child: Image(
                          image: AssetImage(dog.image),
                          width: 100,
                          height: 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(dog.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 211, 208, 208),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(dog.gender,
                                          style: TextStyle(
                                              color: dog.gender == "Male"
                                                  ? Colors.blue
                                                  : Colors.pink)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("${dog.age} yrs",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text(" | Playful",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      Text(dog.location,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500)),
                                    ]),
                                    Text("12 min ago"),
                                  ],
                                ),
                              ],
                            )))
                  ]))));
}
