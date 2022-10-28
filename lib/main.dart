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
      body: list(),
    );
  }
}

Widget list() {
  return ListView.builder(
    itemCount: dogList.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child: card(dogList[index]),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyDogPage(
                    dogId: dogList[index].id,
                  )),
        ),
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

class MyDogPage extends StatelessWidget {
  MyDogPage({super.key, required this.dogId});
  final int dogId;

  @override
  Widget build(BuildContext context) {
    Dog dog = dogList.firstWhere((dog) => dog.id == dogId);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 24,
          ),
        ),
        title: Text(
          dog.name,
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF151B1E),
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Hero(
                      tag: 'mainImage',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: AssetImage(dog.image),
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dog.name,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF151B1E),
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: dog.gender == "Male"
                                  ? Color.fromARGB(255, 143, 192, 207)
                                  : Color.fromARGB(255, 255, 192, 203),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(dog.gender,
                                style: TextStyle(
                                    color: dog.gender == "Male"
                                        ? Colors.blue
                                        : Colors.pink)),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 16, 0, 8),
                    child: Row(children: [
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("12 min ago"),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 8),
                    child: Text(
                      "About me ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color.fromARGB(255, 41, 48, 52),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      dog.about,
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF151B1E),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 8),
                    child: Text(
                      "Quick infos",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color.fromARGB(255, 41, 48, 52),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.pets,
                              color: Colors.red,
                            ),
                            Text(" ${dog.age} yrs",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500)),
                            
                          ],

                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.pets,
                              color: Colors.red,
                            ),
                            Text(" ${dog.color}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.pets,
                              color: Colors.red,
                            ),
                            Text(" ${dog.weight} Kg",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
