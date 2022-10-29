import 'package:flutter/material.dart';
import 'package:tp_28oct/Dog.dart';
import 'package:tp_28oct/FakeDogDatabase.dart';

class MyDogPage extends StatelessWidget {
  MyDogPage({super.key, required this.dogId});
  final int dogId;

  @override
  Widget build(BuildContext context) {
    Dog dog = dogList.firstWhere((dog) => dog.id == dogId);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
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
                      tag: dog.id,
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
                                  ? Color.fromARGB(255, 207, 231, 238)
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
