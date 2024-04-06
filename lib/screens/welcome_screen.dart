import 'package:flutter/material.dart';
import 'package:indihome/screens/signin_screen.dart';
import 'package:indihome/screens/signup_screen.dart';
import 'package:indihome/theme/theme.dart';
import 'package:indihome/Components/colors.dart';
import 'package:indihome/widgets/custom_scaffold.dart';
import 'package:indihome/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'IndiHome\n',
                          style: TextStyle(
                            fontFamily: 'Montserrat', // Set the font family to Montserrat
                            fontWeight: FontWeight.bold, // Make it bold
                            fontSize: 47.0,
                            color: primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '\nWelcome Home to Endless Possibilities: Where Every Detail of Your Dream Space Comes to Life',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
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
