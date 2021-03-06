import 'package:booking_app/Screens/veiw_screens/home_screen.dart';
import 'package:booking_app/widgets_model/custom_elevated_button.dart';
import 'package:booking_app/widgets_model/custom_text.dart';
import 'package:booking_app/widgets_model/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
 final  TextEditingController _emailController = TextEditingController();
 final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              color: KPrimaryColor,
              child: Column(
                children: [
                  SizedBox(height: 60),
                  CustomText(
                    text: 'Reset Password',
                    color: Colors.white,
                    fontSize: 33,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.7,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          CustomText(
                            text:
                                'Enter your email address below to reset password ',
                            color: Colors.grey,
                            alignment: Alignment.center,
                            fontSize: 22,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              controller: _emailController,
                              label: 'Email',
                              hint: 'example@gmail.com',
                              isPassword: false,
                              prefixIcon: Icons.email,
                              suffixIcon: null,
                              type: TextInputType.emailAddress,
                              validate: (String? val) {
                                if (val!.isEmpty || !val.contains('@')) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                              onSave: (value) {
                                print('Email: $value');
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButton(
                            text: 'RESET PASSWORD',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
