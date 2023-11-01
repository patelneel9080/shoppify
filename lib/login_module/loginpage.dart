import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neel_test/Images/app_images.dart';
import 'package:neel_test/config/app_constant.dart';
import 'package:neel_test/firstpage.dart';
import 'package:neel_test/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  String data = "";
  bool isCheck = false;

  Future<String> inputData() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        return data = "InputData";
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(HomePageImg.bkgimage2), fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            image: DecorationImage(
                                image: NetworkImage(HomePageImg.iconimg),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Trendify",
                      style: GoogleFonts.imFellFrenchCanon(fontWeight: FontWeight.w600,
                          color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              ClipRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 370,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "LOGIN",
                          style: GoogleFonts.roboto(
                              color: Colors.black54,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        TextField(
                          onTap: () {},
                          cursorColor: Colors.black54,
                          controller: _usernameController,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              labelText: "Username",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54.withOpacity(0.7)),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Type your username',
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              prefixIcon: const Icon(
                                CupertinoIcons.profile_circled,
                                color: Colors.black54,
                                size: 26,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          enabled: true,
                          controller: _passwordController,
                          onTap: () {},
                          cursorColor: Colors.black,
                          autocorrect: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54.withOpacity(0.7)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54,),
                            ),
                            hintText: 'Type your password',
                            hintStyle: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                            prefixIcon: const Icon(Icons.lock,
                                color: Colors.black54, size: 26),
                          ),
                        ),
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffFF99F5)),
                                elevation: MaterialStateProperty.all(6),
                                fixedSize: MaterialStateProperty.all(
                                    const Size(190, 40)),
                                shadowColor: MaterialStateProperty.all(
                                  Colors.black87,
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)))),
                            onPressed: () async {
                              SharedPreferences pref= await SharedPreferences.getInstance();
                              // Here you can add your logical part for authentication
                              if (_usernameController.text.isEmpty &&
                                  _passwordController.text.isEmpty) {
                                setState(() {
                                  _errorMessage =
                                      'Please enter both username and password.';
                                });
                              } else if (_usernameController.text.isEmpty) {
                                setState(() {
                                  _errorMessage = "Please enter username";
                                });
                              } else if (_passwordController.text.isEmpty) {
                                setState(() {
                                  _errorMessage = "Please enter password";
                                });
                              } else {
                                _errorMessage = "";
                                isCheck = true;
                                setState(() {});
                                Future.delayed(const Duration(seconds: 3), ()  {
                                  if (userName == _usernameController.text &&
                                      userPassword == _passwordController.text) {
                                    isCheck = false;
                                  pref.setBool("isLogin",true);
                                  isLogin=pref.getBool("isLogin")!;
                                  print("isLogin:$isLogin");
                                    setState(() {});
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePageVIew(),
                                        ));
                                  } else if (userName !=
                                      _usernameController.text) {
                                    setState(() {
                                      isCheck = false;
                                      setState(() {});
                                      _errorMessage = "Invalid username";
                                    });
                                  } else if (userPassword !=
                                      _passwordController.text) {
                                    setState(() {
                                      isCheck = false;
                                      setState(() {});
                                      _errorMessage = "Invalid password";
                                    });
                                  }
                                });
                              }
                            },
                            child: (!isCheck)
                                ? const Text("Login")
                                : const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Row(
                            children: [
                              const Text("Do you haven't account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SignupPage()));
                                  },
                                  child: const Text(
                                    "Signup",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
