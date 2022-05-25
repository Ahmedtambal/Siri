import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future ForgotPasswordPage() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      showDialog(context: context,
              builder :  (context) {
          return const AlertDialog(
            content :  Text('Password rest link was send check your email!'),
          );
      },
    );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
                content: Text(e.message.toString())
            );
          }
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter Your Email '
          ),
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
          MaterialButton(
            onPressed: ForgotPasswordPage,
            child: Text('Rest Password',
            style: TextStyle(
              color:  Colors.white
            ),
            ),
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),



          ),
        ],
      ),

    );
  }
}
