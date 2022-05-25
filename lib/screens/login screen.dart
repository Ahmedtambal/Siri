import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forget password.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage ;
  const LoginPage({Key? key, required this.showRegisterPage}): super(key: key);

  @override
  State<LoginPage> createState()=> _LoginPageState();

  }
  class _LoginPageState extends State<LoginPage>{

  // Text controller
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    //

    Future signIn () async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
    }


    @override
    void dispose(){
      _emailController.dispose();
      _emailController.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Center(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.phone_android,
          size: 100,),

          const SizedBox(height: 75),
          // Hello ...
          Text
            ("Hello Again!",
            style : GoogleFonts.bebasNeue(
              fontSize:  52,
            ),
          ),
          const SizedBox(height: 50),
          const Text
            ("Welcome back",
              style : TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
          ),
          const SizedBox(height: 20),


          // email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
               ),
                ),
                ),

          const SizedBox(height: 10),


          // password
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),

                hintText: 'Password',
                fillColor: Colors.grey[200],
                filled: true,

              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return ForgotPassword();
          }
          ),
          );
          },
                   child: Text('Forgot Password?',
                     style: TextStyle(
                     color: Colors.blue,
                     fontWeight: FontWeight.bold,),
                   ),
                 ),
              ],
            ),
          ),

          const SizedBox(height: 10),


          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.0
            ),
            child: GestureDetector(
              onTap: signIn,
              child: Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.orange,
                    borderRadius: BorderRadius.circular(12
                    ),
                ),
                child:  Center(
                  child: Text('Sign In',
                  style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,

                  ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),

          // not reg ? reg now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               'Not a member?',
               style: TextStyle(

                 fontWeight: FontWeight.bold,

               ),
             ),
             GestureDetector(
               onTap: widget.showRegisterPage,
               child: Text(
                 ' Register Now',
                 style: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.bold,

                 )
               ),
             ),
           ],
          )
        ],
    ),
      ),

    )
    )

    );
  }

    
  }

