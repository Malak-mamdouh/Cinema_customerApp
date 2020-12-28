import 'dart:io';

import 'package:ecommerce_app/provider/modelHud.dart';
import 'package:ecommerce_app/screens/home_page.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/widgets/custom_logo.dart';
import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignUp';
  String _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: KMainColor,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHud>(context).isLoading,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: <Widget>[
                CustomLogo(),
                SizedBox(height: height * .06),
                CustomTextField(
                    onClick: (value) {},
                    hint: 'Enter Your Name',
                    icon: Icons.perm_identity),
                SizedBox(height: height * .02),
                CustomTextField(
                    onClick: (value) {
                      _email = value;
                    },
                    hint: 'Enter Your Email',
                    icon: Icons.email),
                SizedBox(height: height * 0.02),
                CustomTextField(
                    onClick: (value) {
                      _password = value;
                    },
                    hint: 'Enter Your Password',
                    icon: Icons.lock),
                SizedBox(height: height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Builder(
                    builder: (context) => FlatButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () async {
                          final modelhud =
                              Provider.of<ModelHud>(context, listen: false);
                          modelhud.changeisLoading(true);
                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                            try {
                              print(_email);
                              final result =
                                  await _auth.signUp(_email, _password);

                              Navigator.pushNamed(context, HomePage.id);
                            } catch (e) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(e.message),
                              ));
                            }
                          }
                          modelhud.changeisLoading(
                              false); //validate to force Rebuild textFormField
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                SizedBox(height: height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'LoginScreen');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
