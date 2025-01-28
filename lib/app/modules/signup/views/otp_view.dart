import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
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
                "Verify With OTP",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),

              Text(
                "To ensure your security,please enter the OTP"
                    "sent to your registered mobile number/email below",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),

              const SizedBox(height: 20),

              // OTP Input Field
              OtpTextField(
                numberOfFields: 4,
                borderColor: Theme.of(context).primaryColor,
                focusedBorderColor: Theme.of(context).primaryColor,
                showFieldAsBox: true,
                textStyle: Theme.of(context).textTheme.titleLarge,
                fieldWidth: screenWidth * 0.12,
                borderRadius: BorderRadius.circular(10),
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  print(verificationCode);
                },
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn’t receive the OTP?",style:Theme.of(context)
                      .textTheme
                      .displayMedium ,),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.SERVICESELECTION);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, screenHeight * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Submit", style: Theme.of(context).textTheme.labelLarge),
              ),

              const SizedBox(height: 10),

              // Cancel Button
              OutlinedButton(
                onPressed: () {
                  // Handle OTP Cancellation
                  Get.back();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  minimumSize: Size(double.infinity, screenHeight * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Having Difficulties with OTP?",
                    style:Theme.of(context)
                      .textTheme
                      .displayMedium ,),
                  TextButton(
                    onPressed: () {
                      // Navigate to help screen
                    },
                    child: Text(
                      "Get Help",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
