import 'package:addmovie/screens/addMovie.dart';
import 'package:flutter/material.dart';
class AdminHome extends StatelessWidget{
  static var tag;

  
   @override


    Widget build(BuildContext context){
      return Scaffold(
       backgroundColor: Color(0xff00000),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFEAAF05),
        title: Text("Movie App"),
       
      ),
      //Creating the Chip list
      body:Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListView(
          children: <Widget>[
           Container(
             height: 40.0,
             width: double.infinity,
             child: ListView(
               scrollDirection: Axis.horizontal,

               children: <Widget>[
                     Padding(
                   padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: FlatButton(
                 shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10)) ,
            onPressed: (){
                  Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => AdminHome()));
               },
           color: Color(0xFFEF0100),
            child: Text(
              'ALL MOVIES',
              style: TextStyle(
                color: Colors.white
              ),
            ),
                padding: EdgeInsets.only(left: 12.0, right: 12.0),

          ),

        ),
                   Padding(
                   padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: FlatButton(
                 shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10)) ,
             onPressed: (){
                  Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => DeleteMovie()));
               },
           color: Color(0xFFEF0100),
            child: Text(
              'ADD MOVIE',
              style: TextStyle(
                color: Colors.white
              ),
            ),
                padding: EdgeInsets.only(left: 12.0, right: 12.0),

          ),

        ),
                
         Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: FlatButton(
              shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10)) ,
               onPressed: (){
                
               },
               color: Color(0xFFEF0100),
               child: Text(
                 'NUM OF SEATS',
                   style: TextStyle(
                  color: Colors.white
              ),
            ),
            padding: EdgeInsets.only(left: 12.0, right: 12.0),

          ),

        ),
                            
               ],
             ),
           ),
            SizedBox(height: 12.0,),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "ALL MOVIES",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0,),
            Container(
              width:double.infinity,
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  
                  child: movieCard("JOKER","images/icons/netflix.png"),
                  
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: movieCard("Avengers","images/icons/netflix.png"),
                  
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: movieCard("Terminator","images/icons/netflix.png"),
                  
                ),
              ],
              ),
            ),
            SizedBox(height: 25.0,),
            Row(
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "ALL MOVIES",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0,),
            Container(
              width:double.infinity,
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: movieCard("JOKER","images/icons/netflix.png"),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: movieCard("Interstellar","images/icons/netflix.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: movieCard("Terminator","images/icons/netflix.png"),
                  ),
                  SizedBox(height: 22.0,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget movieCard(String movieName,String imgPath){
    return InkWell(
      
      child: Column(
        children: <Widget>[
          Expanded(
            
            /////////////image //////////////////////////////////////////
            child:Image.asset(imgPath,fit: BoxFit.fill,width: 130.0,height: 160.0,),
            
          ),
             FlatButton(
              shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10)) ,
               onPressed: (){
                
               },
               color: Color(0xFFEF0100),
               child: Text(
                 'DELETE MOVIE',
                   style: TextStyle(
                  color: Colors.white
              ),
            ),
         

          ),

        
          SizedBox(height: 5.0,),
          //////////////////////////////movie name///////////////////////////////
          Text(movieName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26.0
            ),
            textAlign: TextAlign.start,
          ),
          
        ],
      ),
       
      );
    }
}

  
  
