import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import './signin.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rest_app/apis/api.dart';
// import 'package:rest_app/screens/signin.dart';
//
// import 'package:http/http.dart' as http;
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  late String name, email, password;
  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late ScaffoldMessengerState scaffoldMessenger;
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    "assets/images/bb.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                        "assets/images/1.png",
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                      )),
                      SizedBox(
                        height: 13,
                      ),
                      Text("PsychoSupport MK",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              letterSpacing: 1)),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          "MIS App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black54,
                              letterSpacing: 0.6,
                              fontSize: 11),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontSize: 23,
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text(
                      //       " ",
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.roboto(
                      //         textStyle: TextStyle(
                      //           color: Colors.white70,
                      //           letterSpacing: 1,
                      //           fontSize: 17,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 45),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                controller: _nameController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  name = val!;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                controller: _emailController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  email = val!;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  password = val!;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (isLoading) {
                                          return;
                                        }
                                        if (_nameController.text.isEmpty) {
                                          scaffoldMessenger.showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      "Please Enter Name")));
                                          return;
                                        }
                                        if (!reg
                                            .hasMatch(_emailController.text)) {
                                          scaffoldMessenger.showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      "Enter Valid Email")));
                                          return;
                                        }
                                        if (_passwordController.text.isEmpty ||
                                            _passwordController.text.length <
                                                6) {
                                          scaffoldMessenger.showSnackBar(SnackBar(
                                              content: Text(
                                                  "Password should be min 6 characters")));
                                          return;
                                        }
                                        //signup(_nameController.text,_emailController.text,_passwordController.text);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignIn()));
                                      },
                                      child: Text("CREATE ACCOUNT",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              letterSpacing: 1)),
                                    ),
                                  ),
                                  Positioned(
                                    child: (isLoading)
                                        ? Center(
                                            child: Container(
                                                height: 26,
                                                width: 26,
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: Colors.green,
                                                )))
                                        : Container(),
                                    right: 30,
                                    bottom: 0,
                                    top: 0,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Text("Already have an account?",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                letterSpacing: 0.5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

// signup(name, email, password) async {
//   setState(() {
//     isLoading=true;
//   });
//
//   Map data = {
//     'email': email,
//     'password': password,
//     'name': name
//   };
//
//   print(data.toString());
//
//   final  response= await http.post(
//       Uri.parse(REGISTRATION),
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/x-www-form-urlencoded"
//       },
//       body: data,
//       encoding: Encoding.getByName("utf-8")
//   );
//
//   if (response.statusCode == 200) {
//     setState(() {
//       isLoading=false;
//     });
//
//     Map<String,dynamic>response=jsonDecode(response.body);
//
//     if(!response['error'])
//     {
//       Map<String,dynamic>user=response['data'];
//       print(" User name ${user['data']}");
//       savePref(1,user['name'],user['email'],user['id']);
//       Navigator.pushReplacementNamed(context, "/home");
//     }else{
//       print(" ${response['message']}");
//     }
//
//     scaffoldMessenger.showSnackBar(SnackBar(content:Text("${response['message']}")));
//
//   } else {
//     scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Try again")));
//   }
// }
//
// savePref(int value, String name, String email, int id) async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//
//   preferences.setInt("value", value);
//   preferences.setString("name", name);
//   preferences.setString("email", email);
//   preferences.setString("id", id.toString());
//   preferences.commit();
// }
}
