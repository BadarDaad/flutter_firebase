import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/ui/auth/signup_screen.dart';
import 'package:flutter_firebase/widgets/round_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final _auth = FirebaseAuth.instance;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    String pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // void login() {
  //   _auth
  //       .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
  //       .then((value) {})
  //       .onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());
  //   });
  // }

  @override
   Widget build(BuildContext context) {
    return PopScope(
      onWill  Pop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'LOGIN',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text(
              //   'Login',
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black, // Text color
              //   ),
              // ),
              const SizedBox(height: 40),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email,
                              color: Colors.black), // Icon color
                        ),
                        // For empty field message Enter Email or Password
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Enter Email';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,

                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock,
                              color: Colors.black), // Icon color
                        ),
                        obscureText: true,
                        // For empty field message Enter Email or Password
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Enter Password';
                        //   }
                        //   return null;
                        // },
                      ),

                      const SizedBox(height: 40),
                      RoundButton(
                          title: 'Login',
                          onPressed: () {
                            // Add your login logic here
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          }),
                      const SizedBox(
                          height:
                              30), // Add some space between the button and text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ));
                              },
                              child: const Text('Sign up'))
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
