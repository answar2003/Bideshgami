import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bideshgami/app/global/themes/app_theme.dart';

class ApplyFormView extends StatefulWidget {
  const ApplyFormView({super.key});

  @override
  State<ApplyFormView> createState() => _ApplyFormViewState();
}

class _ApplyFormViewState extends State<ApplyFormView> {
  // Form Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController totalPaymentController = TextEditingController();
  final TextEditingController duePaymentController = TextEditingController();
  final TextEditingController applicationCenterController = TextEditingController();

  // Variable to handle adding more applies
  int applyCount = 1;

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Apply Form",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white,fontSize: 28),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildTextField("Name", nameController),
              _buildTextField("Phone Number", phoneController),
              _buildTextField("Email", emailController),
              _buildTextField("Passport Number", passportController),
              _buildTextField("From (Auto Fill)", fromController),
              _buildTextField("To (Auto Fill)", toController),
              _buildTextField("Service Type (Auto Fill)", serviceTypeController),
              _buildTextField("Total Payment (Auto Fill)", totalPaymentController),
              _buildTextField("Due Payment (Auto Fill)", duePaymentController),
              _buildTextField("Choose Your Application Center", applicationCenterController),

              // Add More Apply Button
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        applyCount++;
                      });
                    },
                    child: const Text(
                      "Add more Apply",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              // Submit Button
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(screenWidth * 0.4, screenHeight * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  // TextField helper function
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        style: Theme.of(context).textTheme.displayMedium,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }
}
