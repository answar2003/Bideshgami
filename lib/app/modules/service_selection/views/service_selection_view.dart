import 'package:bideshgami/app/global/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ServiceSelectionView extends StatefulWidget {
  const ServiceSelectionView({super.key});

  @override
  State<ServiceSelectionView> createState() => _ServiceSelectionViewState();
}

class _ServiceSelectionViewState extends State<ServiceSelectionView> {
  // List of available services
  final List<String> services = [
    "Work Permit",
    "Air-Ticket",
    "Student",
    "Hajj & Umrah",
    "Visa Processing",
    "Tour Package",
    "Hotel Booking",
  ];

  // Selected services (multi-selection)
  final Set<String> selectedServices = {};

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
              SizedBox(height: screenHeight * 0.05),
              Text(
                'What kind of services are you interested in from "BideshGami"?',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize:20,fontWeight: FontWeight.w600,color: Colors.black),
              ),
              const SizedBox(height: 20),

              // Grid of service options
              SizedBox(
                height: screenHeight * 0.28,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return Align(
                          alignment: Alignment.center,
                          child: _buildServiceChip(service));
                    },),
              ),


              // Done Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.COUNTRYSELECTION);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(screenWidth * 0.4, screenHeight * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Next", style: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget to build a selectable service chip
  Widget _buildServiceChip(String service) {
    bool isSelected = selectedServices.contains(service);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedServices.remove(service);
          } else {
            selectedServices.add(service);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Color(0xFFB0D0FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            service,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
