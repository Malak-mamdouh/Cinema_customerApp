import 'package:flutter/cupertino.dart';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('Images/Icons/1.png'),
            ),
            Positioned(
                bottom: 0,
                child: Text(
                  'Cinema',
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
