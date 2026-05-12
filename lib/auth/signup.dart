import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final supabase =
      Supabase.instance.client;

  final TextEditingController fullNameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [

          Positioned(
            top: 130,
            left: 16,
            right: 16,

            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: AppColors.mainCard,

                borderRadius:
                const BorderRadius.only(
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
                      "Signup",

                      style: TextStyle(
                        fontFamily: "InriaSerif",
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // full name
                  const Text(
                    "Full Name",

                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextField(
                    controller:
                    fullNameController,

                    decoration: InputDecoration(
                      hintText:
                      "Enter your Full Name",

                      hintStyle:
                      const TextStyle(
                        color:
                        AppColors.hint_text,
                        fontFamily:
                        "InriaSerif",
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      enabledBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide:
                        const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide: BorderSide(
                          color:
                          AppColors.background,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // email
                  const Text(
                    "E-mail",

                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextField(
                    controller:
                    emailController,

                    decoration: InputDecoration(
                      hintText:
                      "Enter your E-mail",

                      hintStyle:
                      const TextStyle(
                        color:
                        AppColors.hint_text,
                        fontFamily:
                        "InriaSerif",
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      enabledBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide:
                        const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide: BorderSide(
                          color:
                          AppColors.background,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // password
                  const Text(
                    "Password",

                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextField(
                    controller:
                    passwordController,

                    obscureText: true,

                    decoration: InputDecoration(
                      hintText:
                      "Enter your Password",

                      hintStyle:
                      const TextStyle(
                        color:
                        AppColors.hint_text,
                        fontFamily:
                        "InriaSerif",
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      enabledBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide:
                        const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide: BorderSide(
                          color:
                          AppColors.background,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // confirm password
                  const Text(
                    "Confirm Password",

                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  TextField(
                    controller:
                    confirmPasswordController,

                    obscureText: true,

                    decoration: InputDecoration(
                      hintText:
                      "Confirm Password",

                      hintStyle:
                      const TextStyle(
                        color:
                        AppColors.hint_text,
                        fontFamily:
                        "InriaSerif",
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      enabledBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide:
                        const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      focusedBorder:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            12),

                        borderSide: BorderSide(
                          color:
                          AppColors.background,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // button
                  Center(
                    child: SizedBox(
                      width: 130,
                      height: 45,

                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.button
                              .withOpacity(
                              0.58),
                        ),

                        onPressed: () async {

                          String fullName =
                          fullNameController
                              .text
                              .trim();

                          String email =
                          emailController
                              .text
                              .trim();

                          String password =
                          passwordController
                              .text
                              .trim();

                          String confirmPassword =
                          confirmPasswordController
                              .text
                              .trim();

                          // empty check
                          if(fullName.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              confirmPassword
                                  .isEmpty){

                            ScaffoldMessenger.of(
                                context)
                                .showSnackBar(

                              const SnackBar(
                                content: Text(
                                  "Fill all fields",
                                ),
                              ),
                            );

                            return;
                          }

                          // password match
                          if(password !=
                              confirmPassword){

                            ScaffoldMessenger.of(
                                context)
                                .showSnackBar(

                              const SnackBar(
                                content: Text(
                                  "Password not match",
                                ),
                              ),
                            );

                            return;
                          }

                          try {

                            await supabase
                                .auth
                                .signUp(
                              email: email,
                              password:
                              password,
                            );

                            ScaffoldMessenger.of(
                                context)
                                .showSnackBar(

                              const SnackBar(
                                content: Text(
                                  "Signup Successful",
                                ),
                              ),
                            );

                          }

                          catch(e){

                            ScaffoldMessenger.of(
                                context)
                                .showSnackBar(

                              SnackBar(
                                content: Text(
                                  e.toString(),
                                ),
                              ),
                            );
                          }

                        },

                        child: const Text(
                          "Signup",

                          style: TextStyle(
                            fontFamily:
                            "InriaSerif",

                            fontWeight:
                            FontWeight.bold,
                          ),
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