import 'package:flutter/material.dart';
import 'package:freels/constants.dart';
import 'package:freels/views/widgets/textinputfield.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 55, 52, 52),
              borderRadius: BorderRadius.circular(15)),
          height: MediaQuery.of(context).size.height - 150,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                    ),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: () => authController.pickImage(),
                          icon: const Icon(Icons.add_a_photo)))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextInputField(
                    controller: _usernameController,
                    labelText: 'User name',
                    icon: const Icon(Icons.email),
                    isObscure: false),
              ),
              // SizedBox(
              //   height: 1,
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextInputField(
                    controller: _emailController,
                    labelText: 'Email.com',
                    icon: const Icon(Icons.email),
                    isObscure: false),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextInputField(
                    controller: _passwordController,
                    labelText: 'password',
                    icon: const Icon(Icons.lock),
                    isObscure: true),
              ),
              const SizedBox(height: 15),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () => authController.registerUser(
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text,
                    authController.profilePhoto),
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
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: () {},
                  child: const Text('Already have an account? Log in'))
            ],
          ),
        ),
      ),
    );
  }
}
