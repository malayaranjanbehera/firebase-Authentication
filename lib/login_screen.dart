import 'package:flutter/material.dart';
import 'package:mecreate_firebase/signup_screen.dart';
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('LogIn',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
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
              obscureText: true,
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
              //passWord in dotter format like .............
              obscureText: true,
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
            Center(
              child: Container(
                  height: 45,
                  width: 200,
                  child: Center(child: Text('Log in',style: TextStyle(color: Colors.white,fontSize: 22),)),
                  decoration: BoxDecoration(
                    color:  Colors.blue.shade500,
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SizedBox(height: 21,),
            GestureDetector(
               onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
               },
                child: Center(
                    child: Text('Create an Account',
                        style: TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.bold)
                    )
                )
            )
          ],
        ),
      ),
    );;
  }
}
