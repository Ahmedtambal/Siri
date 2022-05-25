import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // Text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void Dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp () async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
    }
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    }
    else {
      return false ;
    }
  }
  @override
  Widget build(BuildContext context) {
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
                      ("Hello there!",
                      style : GoogleFonts.bebasNeue(
                        fontSize:  52,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text
                      (" Register below ",
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
                    // confirm password
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: ' Confirm Password',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0
                      ),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                          padding:  EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.orange,
                            borderRadius: BorderRadius.circular(12
                            ),
                          ),
                          child:  Center(
                            child: Text('Sign Up',
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
                          'I am a member',
                          style: TextStyle(

                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                              ' Login now',
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
