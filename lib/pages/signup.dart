import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? name, email, password;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && email != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              "Registered Sucessfully",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogIn()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 20.0),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Email Already Exist",
                style: TextStyle(fontSize: 20.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("lib/assets/images/Shopping.png.png"),
                Center(
                  child: Text(
                    "Sign Up",
                    style: AppWidget.semiboldTextFeildsStyle(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "Please enter the details below to\n                       continue",
                    style: AppWidget.lightTextFieldStyle(),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Name",
                  style: AppWidget.semiboldTextFeildsStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                        color: const Color(0xfff4f5f9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Name';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Email",
                  style: AppWidget.semiboldTextFeildsStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                        color: const Color(0xfff4f5f9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Email';
                        }
                        return null;
                      },
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Password",
                  style: AppWidget.semiboldTextFeildsStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                        color: const Color(0xfff4f5f9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Set your Password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    )),
                const SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        name= namecontroller.text;
                        email= emailcontroller.text;
                        password= passwordcontroller.text;
                      });
                    }
                    registration();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                          child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
