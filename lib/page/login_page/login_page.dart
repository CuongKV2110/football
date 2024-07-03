import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../constants/constants.dart';
import '../../widget/app_button.dart';
import '../../widget/app_input.dart';
import '../../widget/keyboard_dismiss.dart';
import '../root_page/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appBackground,
          body: WKeyboardDismiss(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                    const Text(
                      'Welcome to Course App',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    hSpaceItem,
                    const Text("Helps you learn better every day"),
                    const SizedBox(
                      height: 60,
                    ),
                    AppInput(
                      hintText: 'Username',
                      controller: usernameController,
                      leadingIcon: const Icon(
                        Ionicons.person_outline,
                        size: 22,
                      ),
                    ),
                    hSpaceItem1,
                    AppInput(
                      hintText: 'Password',
                      controller: passwordController,
                      leadingIcon: const Icon(
                        Ionicons.key_outline,
                        size: 22,
                      ),
                      obscureText: true,
                      usingEyeIcon: true,
                    ),
                    hSpaceItem1,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Forgot password ?')],
                    ),
                    hSpaceItem2,
                    AppButton(
                      backgroundColor: Colors.grey,
                      title: 'Log In',
                      onTap: () {
                        if (usernameController.text == 'admin' &&
                            passwordController.text == '12345') {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const RootPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                    ),
                    hSpaceItem2,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ?'),
                        wSpaceItem1,
                        Text(
                          'Register now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    hSpaceItem2,
                    const Center(
                      child: Text('Or'),
                    ),
                    hSpaceItem2,
                    AppButton(
                      buttonHeight: 48,
                      backgroundColor: Colors.black,
                      title: 'Continue with Apple ID',
                      onTap: () {},
                    ),
                    hSpaceItem,
                    AppButton(
                      buttonHeight: 48,
                      backgroundColor: Colors.redAccent,
                      title: 'Continue with Google',
                      onTap: () {},
                    ),
                    hSpaceItem,
                    AppButton(
                      buttonHeight: 48,
                      backgroundColor: Colors.blue,
                      title: 'Continue with Facebook',
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit() {}
}
