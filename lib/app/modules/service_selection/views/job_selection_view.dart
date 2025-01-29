import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class JobSelectionView extends StatefulWidget {
  const JobSelectionView({super.key});

  @override
  State<JobSelectionView> createState() => _JobSelectionViewState();
}

class _JobSelectionViewState extends State<JobSelectionView> {
  // List of available job options
  final List<String> jobs = [
    "Nursery Workers",
    "Worker",
    "Restaurant Labor",
    "General Worker",
    "Hotel Boy",
    "Worker",
    "Storage Labor",
    "Driver",
    "Salesman",
    "Sailors",
    "Construction Worker",
    "Office Assistant",
    "Businessman",
    "Waiter",
    "Electric Technician",
  ];

  // Selected jobs
  final Set<String> selectedJobs = {};
  final TextEditingController searchController = TextEditingController();

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

              Text(
                "Select the Job of Your Choice",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Search Bar
              _buildSearchBar(),

              const SizedBox(height: 20),
              // Grid of Job Selection
              SizedBox(
                height: screenHeight * 0.5,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: jobs.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Align(
                        alignment: Alignment.center,
                        child: _buildJobChip(job));
                  },),
              ),
              const SizedBox(height: 20),

              // Next Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
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

  /// Search Bar Widget
  Widget _buildSearchBar() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {}); // Refresh UI on search input change
      },
      decoration: InputDecoration(
        hintText: "You Find Work",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: const Icon(Icons.search, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// Job Selection Chip
  Widget _buildJobChip(String job) {
    bool isSelected = selectedJobs.contains(job);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedJobs.remove(job);
          } else {
            selectedJobs.add(job);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            job,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
