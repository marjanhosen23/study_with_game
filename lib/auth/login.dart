import 'package:flutter/material.dart';
import 'package:study_with_game/auth/forget_password.dart';
import 'package:study_with_game/auth/signup.dart';
import 'package:study_with_game/common/homepage.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final supabase =
      Supabase.instance.client;

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [

          // top image
          Positioned(
            top: 100,
            right: 0,
            left: 100,

            child: Image.asset(
              "assets/login/graduate.png",
              width: 214,
              height: 214,
            ),
          ),

          // login card
          Positioned(
            top: 280,
            left: 16,
            right: 16,

            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color:AppColors.mainCard,

                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  // title
                  const Center(
                    child: Text(
                      "Login",

                      style: TextStyle(
                        fontFamily: "InriaSerif",
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // email text
                  const Text(
                    "E-mail",

                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // email field
                  TextField(
                    controller: emailController,

                    decoration: InputDecoration(
                      hintText: "Enter your E-mail",
                      hintStyle: const TextStyle(
                        color: AppColors.hint_text,
                        fontFamily: "InriaSerif",
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),

                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),

                        borderSide: BorderSide(
                          color: AppColors.background,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // password text
                  const Text(
                    "Password",

                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // password field
                  TextField(
                    controller: passwordController,
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: "Enter your Password",

                      hintStyle: const TextStyle(
                        color: AppColors.hint_text,
                        fontFamily: "InriaSerif",
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),

                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),

                        borderSide: BorderSide(
                          color: AppColors.background,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // button
                  Center(
                    child: SizedBox(
                      width: 130,
                      height: 45,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.button.withOpacity(0.58),
                        ),

                        onPressed: () async {

                          String email =
                          emailController.text.trim();

                          String password =
                          passwordController.text.trim();

                          if(email.isEmpty ||
                              password.isEmpty){

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(
                                content:
                                Text("Fill all fields"),
                              ),
                            );

                            return;
                          }

                          try {

                            await supabase.auth.signInWithPassword(

                              email: email,
                              password: password,
                            );

                            Navigator.pushReplacement(

                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                const HomePage(),
                              ),
                            );

                          }

                          catch(e){

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              SnackBar(
                                content:
                                Text(e.toString()),
                              ),
                            );
                          }

                        },

                        child: Text(
                          "Login",

                          style: TextStyle(
                            fontFamily: "InriaSerif",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                  ),

                  const SizedBox(height: 24),

                  // create account
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                     Text(
                        "Don’t have an Account? ",

                        style: TextStyle(
                          color:Theme.of(context).textTheme.headlineLarge?.color,
                          fontFamily: "Inter",
                        ),
                      ),

                      GestureDetector(
                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );

                        },
                        child:Text(
                          "Create",

                          style: TextStyle(
                            color: Theme.of(context).textTheme.labelLarge?.color,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 14),

                  // forget password
                  Center(
                    child: GestureDetector(
                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ),
                        );

                      },
                      child: Text(
                        "Forget Password",

                        style: TextStyle(
                          color:Theme.of(context).textTheme.bodySmall?.color,
                          fontFamily: "Inter", fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}