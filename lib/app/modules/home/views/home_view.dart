import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner with Search
            Stack(
              children: [
                Image.asset(
                  'assets/images/aeroplane.png',
                  width: screenWidth,
                  height: screenHeight * 0.3,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: screenHeight * 0.02,
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                  child: _buildSearchBar(context),
                ),
              ],
            ),
            // Icon Categories
            _buildCategoryIcons(),

            const SizedBox(height: 40),
            // Promotional Banners
            _buildPromoBanners(),

            const SizedBox(height: 20),
            // Sections (Work Permit, Student, Hajj & Umrah, Tour Package)
            _buildSection("Work Permit",context),
            _buildSection("Student",context),
            _buildSection("Hajj & Umrah",context),
            _buildSection("Tour Package",context),
          ],
        ),
      ),
    );
  }

  /// Search Bar Widget
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.displayMedium,
              decoration: const InputDecoration(
                hintText: "Search in Bideshgami",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search, color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }

  /// Categories Icons Widget
  Widget _buildCategoryIcons() {
    final categories = [
      {"title": "Air-Ticket", "path": 'assets/images/ticket.png'},
      {"title": "Work Permit", "path": 'assets/images/workpermit.png'},
      {"title": "Student Visa", "path": 'assets/images/studentvisa.png'},
      {"title": "Hajj & Umrah", "path": 'assets/images/hajj.png'},
      {"title": "Visa Processing", "path": 'assets/images/visaprocessing.png'},
      {"title": "Tour Package",  "path": 'assets/images/tourpackage.png'},
      {"title": "Hotel Booking", "path": 'assets/images/hotelbooking.png'},
      {"title": "Video", "path": 'assets/images/video.png'},
      {"title": "Question", "path": 'assets/images/question.png'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      height: 310,
      child: GridView.builder(
        itemCount: categories.length,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
          final category = categories[index];
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Image.asset(category['path']!,width: 32,height: 32,),
                  // child: Icon(category["icon"] as IconData, color: Colors.white, size: 30),
                ),
                const SizedBox(height: 5),
                Text(
                    overflow: TextOverflow.ellipsis,
                    category["title"] as String, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400,fontSize: 12)),
              ],
            );
          },),
    );
  }

  /// Promotional Banners Widget
  Widget _buildPromoBanners() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset('assets/images/promo_banner1.png', fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Image.asset('assets/images/promo_banner2.png', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  /// Section Widget (For Work Permit, Student, Hajj & Umrah, etc.)
  Widget _buildSection(String sectionTitle,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: Theme.of(Get.context!).textTheme.titleSmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("View All »",style: Theme.of(context).textTheme.titleSmall,),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Horizontal Scrollable List of Cards
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => _buildWorkPermitCard(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Work Permit Card Widget
  Widget _buildWorkPermitCard(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset('assets/images/placeholder.png', height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Malaysia Work Permit", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const Text("15,000 BDT", style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text("20 Days Ago", style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.DETAILS);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("View Details",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
