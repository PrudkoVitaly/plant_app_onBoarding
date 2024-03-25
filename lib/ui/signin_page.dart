import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app_onboarding/constants.dart';
import 'package:plant_app_onboarding/ui/root_page.dart';

import 'onboarding-screen.dart';
import 'screens/forgot_password.dart';
import 'screens/signup_page.dart';
import 'screens/widgets/custom_textfield.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/signin.png',
                  height: 330,
                  width: size.width,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // const SizedBox(height: 30),
                const CustomTextfield(
                  icon: Icons.alternate_email,
                  obscureText: false,
                  hintText: "Enter Username",
                ),
                const CustomTextfield(
                  icon: Icons.lock,
                  obscureText: true,
                  hintText: "Enter Password",
                ),
                // const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: const RootPage(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: const RootPage(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const ForgotPassword(),
                              type: PageTransitionType.bottomToTop),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Forgot Password?',
                              style: TextStyle(
                                  color: Constants.blackColor),
                            ),
                            const WidgetSpan(
                                child: SizedBox(width: 10)),
                            TextSpan(
                              text: 'Reset Here',
                              style: TextStyle(
                                  color: Constants.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 3,
                      color: Colors.blue,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 3,
                      color: Colors.pinkAccent,
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child:
                            Image.asset('assets/images/google.png'),
                      ),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: const SignUp(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'New to Planty?',
                            style: TextStyle(
                                color: Constants.blackColor),
                          ),
                          const WidgetSpan(
                              child: SizedBox(width: 10)),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                                color: Constants.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
