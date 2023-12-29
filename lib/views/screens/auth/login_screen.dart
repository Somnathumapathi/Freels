import 'package:flutter/material.dart';
import 'package:freels/constants.dart';
import 'package:freels/controllers/auth_controller.dart';
import 'package:freels/views/widgets/textinputfield.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 55, 52, 52),
              borderRadius: BorderRadius.circular(15)),
          height: MediaQuery.of(context).size.height - 350,
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextInputField(
                    controller: _emailController,
                    labelText: 'Email.com',
                    icon: Icon(Icons.email),
                    isObscure: false),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextInputField(
                    controller: _passwordController,
                    labelText: 'password',
                    icon: Icon(Icons.lock),
                    isObscure: true),
              ),
              SizedBox(height: 20),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () => authController.loginUser(
                    _emailController.text, _passwordController.text),
                decoration: const NeoPopTiltedButtonDecoration(
                  color: Color.fromRGBO(255, 235, 52, 1),
                  plunkColor: Color.fromRGBO(255, 235, 52, 1),
                  shadowColor: Color.fromRGBO(36, 36, 36, 1),
                  showShimmer: true,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 15,
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  child: Text('Don\'t have an account? Sign in'))
            ],
          ),
        ),
      ),
    );
  }
}
