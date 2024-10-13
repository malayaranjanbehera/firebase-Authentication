
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mecreate_firebase/login_screen.dart';
import 'package:mecreate_firebase/services/firebase_auth_methods.dart';
import 'package:mecreate_firebase/services/showSnackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _cpasswordController=TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();
  }

  void signUpUser()async{

if(_emailcontroller=="" || _passwordController=="" || _cpasswordController==""){
  showSnackBar(context, 'please fillup all details');
}
else if(_passwordController!= _cpasswordController){
  showSnackBar(context, 'PassWord dont match!');

}
else{
    await FirebaseAuthMethods(FirebaseAuth.instance).SignUpWithEmail(
      email: _emailcontroller.text.trim(), 

      password: _passwordController.text.trim(),
       context: context);
}



  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Create an Account',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.blue
              ),),
            TextFormField(
              //passWord in dotter format like .............
              controller: _emailcontroller,
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.9)
                      )
                  )
              ),
            ),
            SizedBox(height: 21,),

            Text(
              'PassWord',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.blue
              ),),
            TextFormField(
              //passWord in dotter format like ............
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Enter Password',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.9)
                      )
                  )
              ),
            ),
             SizedBox(height: 21,),

            Text(
              'C_PassWord',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.blue
              ),),
            TextFormField(
              //passWord in dotter format like ............
              controller: _cpasswordController,
              decoration: InputDecoration(
                  hintText: 'Enter C_Password',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.9)
                      )
                  )
              ),
            ),
            SizedBox(height: 30,),
           Center(
             child: GestureDetector(

            onTap: (){
              signUpUser();
              Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen(),));
            },//-

              
               child: Container(
                 height: 45,
                 width: 200,
                  child: Center(child: 
                  Text('Create Account',
                  style: TextStyle(color: Colors.white,fontSize: 22),)),
                  decoration: BoxDecoration(
                    color:  Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  )
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}