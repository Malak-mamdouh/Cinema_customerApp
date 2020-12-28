import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DeleteMovie extends StatefulWidget {
  static var tag;

  @override
  _DeleteMovieState createState() => _DeleteMovieState();
}

class _DeleteMovieState extends State<DeleteMovie> {

  bool circular = false;
  PickedFile _imageFile;
 
  final ImagePicker _picker = ImagePicker();
  @override

  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      backgroundColor: Color(0xFFEAAF05),

        title: Text("Movie App"),
       
      ),
      body: Form(
        
      
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
              onTap: () {},
              
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
    });
  }

  Widget movietitleTextField() {
    return TextFormField(
    
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
  
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
         
          borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.orange   
        )
        
        ),
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