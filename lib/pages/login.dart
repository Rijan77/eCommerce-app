import 'package:ecommerce_app/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';
import 'bottomnav.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String email="", password="";

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();


  userLogin ()async{
    try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNav()));

    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user found for that email",
              style: TextStyle(fontSize: 20.0),
            )));
      }
      else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong Password ! Try again",
              style: TextStyle(fontSize: 20.0),
            )));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("lib/assets/images/Shopping.png.png"),
                Center(
                  child: Text(
                    "Sign In",
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
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child:  TextFormField(
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Please Enter your Email';
                        }
                        return null;
                      },
                      controller: emailcontroller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email"
                    ),
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
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Please Enter your Password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password"
                      ),
                    )),
                const SizedBox(height: 10.0,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forget Password!?", style: TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.w500),),
                  ],
                ),
                const SizedBox(height: 25.0,),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        email=emailcontroller.text;
                        password=passwordcontroller.text;
                      });
                    }
                    userLogin();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: AppWidget.lightTextFieldStyle(),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signup()));
                      },
                        child: const Text("Sign Up", style: TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.w500),)),
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
