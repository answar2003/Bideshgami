import 'package:bideshgami/app/global/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // Track the password visibility
  bool isObsecure = true;
  bool isConfirmObsecure = true;

  // Selected user type (Customer, Merchant, Agency)
  String selectedUserType = "Customer";

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Image.asset(
                'assets/images/logo.png',
                height: screenHeight * 0.15,
                width: screenWidth * 0.5,
              ),
              SizedBox(height: screenWidth * 0.05),
              Text(
                "Create a new profile",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20),

              // Radio Button Selection for User Type
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRadioButton("Customer"),
                  _buildRadioButton("Merchant"),
                  _buildRadioButton("Agency"),
                ],
              ),

              const SizedBox(height: 20),

              // Signup Form Fields
              Row(
                children: [
                  Expanded(
                    child: _buildTextField("First Name"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField("Last Name"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField("Phone Number"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField("E-mail"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField("District"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField("Police Station"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildPasswordField("Password", isObsecure, () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    }),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildPasswordField("Confirm Password", isConfirmObsecure, () {
                      setState(() {
                        isConfirmObsecure = !isConfirmObsecure;
                      });
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Signup Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.OTP);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, screenHeight * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Sign up", style: Theme.of(context).textTheme.labelLarge),
              ),
              const SizedBox(height: 20),

              const Divider(),
              const SizedBox(height: 10),

              // Signup with Google and Facebook
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Or Sign up with",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.dark),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/google_logo.svg', width: 32, height: 32),
                      SizedBox(width: screenWidth * 0.10),
                      SvgPicture.asset('assets/icons/fb_logo.svg', width: 32, height: 32),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget to build the radio button selection
  Widget _buildRadioButton(String title) {
    return Row(
      children: [
        Radio<String>(
          value: title,
          groupValue: selectedUserType,
          onChanged: (value) {
            setState(() {
              selectedUserType = value!;
            });
          },
          activeColor: Theme.of(context).primaryColor,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }

  /// Widget to build a generic text field
  Widget _buildTextField(String hintText) {
    return TextField(
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// Widget to build password fields with visibility toggle
  Widget _buildPasswordField(String hintText, bool isObscure, VoidCallback toggleVisibility) {
    return TextField(
      style: Theme.of(context).textTheme.displayMedium,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF3F3F3F),
          ),
          onPressed: toggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
