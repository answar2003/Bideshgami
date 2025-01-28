
import 'package:bideshgami/app/global/themes/app_theme.dart';
import 'package:bideshgami/app/modules/login/controllers/toggle_controller.dart';
import 'package:bideshgami/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';




class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Access the ToggleController
  final ToggleController controller = Get.find<ToggleController>();

  // Track the password visibility
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/aeroplane.png',
            width: screenWidth,
            opacity: const AlwaysStoppedAnimation(0.2), // Faint opacity for subtle effect
          ),

          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Image.asset(
                    'assets/images/logo.png',
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.5,
                  ),
                  SizedBox(height: screenWidth * 0.2),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return ToggleButtons(
                      borderColor: Color(0xFF858585),
                      fillColor: Theme.of(context).primaryColor,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      selectedBorderColor:Color(0xFF858585),
                      selectedColor: Colors.white,
                      isSelected: List.generate(
                        3,
                            (index) => controller.selectedIndex.value == index,
                      ),
                      onPressed: (index) {
                        controller.updateIndex(index); // Update the index in the controller
                      },
                      borderRadius: BorderRadius.circular(10),
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Text("Customer"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Text("Merchant"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Text("Agency"),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 20),
                  TextField(
                    style: Theme.of(context).textTheme.displayMedium,
                    decoration: InputDecoration(
                      hintText: "E-mail or phone",
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                      prefixIcon: Icon(Icons.email,color: Theme.of(context).primaryColor,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    style: Theme.of(context).textTheme.displayMedium,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                      prefixIcon: Icon(Icons.lock,color:Theme.of(context).primaryColor),
                      suffixIcon: IconButton(
                        icon: Icon(isObsecure? Icons.visibility : Icons.visibility_off,color: const Color(0xFF3F3F3F),),
                        onPressed: () {
                          setState(() {
                            isObsecure=!isObsecure;
                          });

                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        splashFactory: NoSplash.splashFactory
                      ),
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppTheme.dark),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(double.infinity, screenHeight * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Login",style: Theme.of(context).textTheme.labelLarge,),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member?",style: Theme.of(context).textTheme.displayMedium,),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          "Create New Account",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " Or Log in with",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: AppTheme.dark),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/google_logo.svg',width: 32,height: 32,),
                      SizedBox(width: screenWidth * 0.10,),
                      SvgPicture.asset('assets/icons/fb_logo.svg',width: 32,height: 32,)
                    ],
                  ),
                ],
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

