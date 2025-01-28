import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CountrySelectionView extends StatefulWidget {
  const CountrySelectionView({super.key});

  @override
  State<CountrySelectionView> createState() => _CountrySelectionViewState();
}

class _CountrySelectionViewState extends State<CountrySelectionView> {
  final List<Map<String, String>> countries = [
    {"name": "Saudi Arabia", "flag": "🇸🇦"},
    {"name": "UAE", "flag": "🇦🇪"},
    {"name": "Malaysia", "flag": "🇲🇾"},
    {"name": "Oman", "flag": "🇴🇲"},
    {"name": "Qatar", "flag": "🇶🇦"},
    {"name": "Kuwait", "flag": "🇰🇼"},
    {"name": "Italy", "flag": "🇮🇹"},
    {"name": "Canada", "flag": "🇨🇦"},
    {"name": "Bahrain", "flag": "🇧🇭"},
    {"name": "Jordan", "flag": "🇯🇴"},
    {"name": "Romania", "flag": "🇷🇴"},
    {"name": "United States", "flag": "🇺🇸"},
    {"name": "Lebanon", "flag": "🇱🇧"},
    {"name": "United Kingdom", "flag": "🇬🇧"},
    {"name": "Libya", "flag": "🇱🇾"},
    {"name": "France", "flag": "🇫🇷"},
    {"name": "Iraq", "flag": "🇮🇶"},
    {"name": "South Korea", "flag": "🇰🇷"},
    {"name": "Australia", "flag": "🇦🇺"},
    {"name": "Brunei", "flag": "🇧🇳"},
    {"name": "Mauritius", "flag": "🇲🇺"},
    {"name": "Portugal", "flag": "🇵🇹"},
    {"name": "Germany", "flag": "🇩🇪"},
    {"name": "India", "flag": "🇮🇳"},
    {"name": "Japan", "flag": "🇯🇵"},
    {"name": "Poland", "flag": "🇵🇱"},
    {"name": "Spain", "flag": "🇪🇸"},
    {"name": "Switzerland", "flag": "🇨🇭"},
    {"name": "Malta", "flag": "🇲🇹"},
    {"name": "Turkey", "flag": "🇹🇷"},
    {"name": "Greece", "flag": "🇬🇷"},
    {"name": "New Zealand", "flag": "🇳🇿"},
  ];

  final Set<String> selectedCountries = {};
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
                "Select 5 Countries of Your Choice",
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

              // Grid of Country Selection
              SizedBox(
                height: screenHeight * 0.56,
                child: GridView.builder(
                  padding: EdgeInsets.zero,

                  itemCount: countries
                      .where((country) => country["name"]!
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
                      .length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final filteredCountries = countries
                        .where((country) => country["name"]!
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                        .toList();
                    final country = filteredCountries[index];
                    return _buildCountryChip(country);
                  },
                ),
              ),

              const SizedBox(height: 20),
              // Next Button
              ElevatedButton(
                onPressed: () {
                  if (selectedCountries.length <= 5) {
                  } else {
                    Get.snackbar(
                      "Selection Error",
                      "Please select exactly 5 countries",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  }
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
        hintText: "Search Countries",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: const Icon(Icons.search, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black)
        ),
      ),
    );
  }

  /// Country Selection Chip
  Widget _buildCountryChip(Map<String, String> country) {
    bool isSelected = selectedCountries.contains(country["name"]);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCountries.remove(country["name"]);
          } else {
            if (selectedCountries.length < 5) {
              selectedCountries.add(country["name"]!);
            } else {
              Get.snackbar(
                "Selection Limit",
                "You can only select up to 5 countries",
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
            }
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : const Color(0xFFB0D0FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              country["flag"]!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 6),
            Text(
              country["name"]!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
