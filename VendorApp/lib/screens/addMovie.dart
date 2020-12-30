import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class DeleteMovie extends StatefulWidget {
  static var tag;

  @override
  _DeleteMovieState createState() => _DeleteMovieState();
}

class _DeleteMovieState extends State<DeleteMovie> {
  bool circular = false;
  PickedFile _imageFile;

  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  String _title, _description, _time, _numberOfSeats;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFEAAF05),
        title: Text("Movie App"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            movietitleTextField(),
            SizedBox(
              height: 20,
            ),
            numofseatsTextField(),
            SizedBox(
              height: 20,
            ),
            movietimeField(),
            SizedBox(
              height: 20,
            ),

            descriptionTextField(),
            SizedBox(
              height: 20,
            ),
            //////////////button///////////////////
            InkWell(
              onTap: () {
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();
                  createData();
                  _globalKey.currentState.reset();
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "ADD MOVIE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  createData() {
    print("created");
    DocumentReference firestore =
        Firestore.instance.collection("Movies").document(_title);
    Map<String, dynamic> movies = {
      "title": _title,
      "description": _description,
      "time": _time,
      "seats": _numberOfSeats
    };
    firestore.setData(movies).whenComplete(() => print("$_title created"));
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("images/icons/netflix.png")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose MOVIE photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      print("image path $_imageFile");
    });
  }

  uploadPic() async {
    final firebaseStorage = FirebaseStorage.instance;
    String fileName = Path.basename(_imageFile.path);
    var file = File(_imageFile.path);
    var snapshot = await firebaseStorage.ref().child(fileName).putFile(file);
  }

  Widget movietitleTextField() {
    return TextFormField(
      onSaved: (value) {
        _title = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "MOVIE TITLE",
      ),
    );
  }

  Widget numofseatsTextField() {
    return TextFormField(
      onSaved: (value) {
        _numberOfSeats = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "NUM OF SEATS",
      ),
    );
  }

  Widget movietimeField() {
    return TextFormField(
      onSaved: (value) {
        _time = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "MOVIE TIME",
      ),
    );
  }

  Widget descriptionTextField() {
    return TextFormField(
      onSaved: (value) {
        _description = value;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: " MOVIE DESCRIPTION",
      ),
    );
  }
}
