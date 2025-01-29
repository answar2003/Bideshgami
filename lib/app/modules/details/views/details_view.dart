import 'package:bideshgami/app/global/themes/app_theme.dart';
import 'package:bideshgami/app/modules/apply/views/apply_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: screenHeight * 0.10,
                width: screenWidth * 0.5,
              ),
              SizedBox(height: screenWidth * 0.05),
              // Job Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Work Permit Visa in Romania",
                    style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text("Posted on 01 Jul 12:19 pm"),
                ],
              ),
        
              // Job Image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'assets/images/details_placeholder.png',
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
        
              // Job Information Section
              _buildJobDetails(context),
        
              const SizedBox(height: 20),
        
              // Job Description
              _buildJobDescription(),
        
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Safety Alert Widget
  Widget _buildSafetyAlert() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.yellow.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.warning, color: Colors.orange, size: 30),
            const SizedBox(height: 5),
            Text(
              "Stay Alert: Avoid Online Scams",
              style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Never share card details or OTPs, and always verify items in person before payment. Bideshgami does not offer a delivery service. Stay vigilant!",
              textAlign: TextAlign.center,
              style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400,)
            ),
          ],
        ),
      ),
    );
  }

  /// Job Details Section
  Widget _buildJobDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job Title & Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BDT 70,000",
                style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // Job Details
          _buildDetailRow("Country Name", "Romania"),
          _buildDetailRow("Type of Visa", "Work Permit"),
          _buildDetailRow("Type of Work", "Plumber"),
          _buildDetailRow("Company Name", "xyz company"),
          _buildDetailRow("Working Hours", "10 hours"),
          _buildDetailRow("Processing Time", "2 months"),
          _buildDetailRow("Age", "21-40"),
          _buildDetailRow("Education", "No need"),
          _buildDetailRow("Experience", "No need"),
          _buildDetailRow("Payment System", "50,000 BDT before, 3,00000 BDT after visa"),
          _buildDetailRow("Documents", "Passport, Medical Fit Certificate"),

          const SizedBox(height: 10),

          // Apply & Chat Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(

                  ),
                  child: Text("Chat",style: Theme.of(context).textTheme.labelLarge,),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApplyFormView(),));
                  },
                  style: ElevatedButton.styleFrom(
                  ),
                  child: Text("Apply Now",style: Theme.of(context).textTheme.labelLarge,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Job Description Section
  Widget _buildJobDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "However, as the workaround description implies, this separate tracking carries the risk of someone still being served the same ad even after the limit has been exceeded. Nurses found that working safety isn’t only about PPE and sanitation, but also a much broader range of practices, from using technology in new ways to changing job descriptions.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  /// Similar Ads Section
  Widget _buildSimilarAds() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Similar Ads",
            style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Similar Ads List
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => _buildSimilarAdCard(),
            ),
          ),
        ],
      ),
    );
  }

  /// Similar Ad Card
  Widget _buildSimilarAdCard() {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset('assets/images/similar_ad.png', height: 80, width: double.infinity, fit: BoxFit.cover),
          ),
          const Text("Work Permit Romania", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const Text("15,000 BDT", style: TextStyle(fontSize: 14, color: Colors.blue)),
        ],
      ),
    );
  }

  /// Helper function to create job details rows
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
