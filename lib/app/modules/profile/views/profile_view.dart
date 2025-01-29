import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Sidebar Menu
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/profile_image.jpg"),
                  ),
                  const SizedBox(height: 15),

                  // User Name
                  Text(
                    "Zahidul Islam Sifat",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24,fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Sidebar Menu Options
                  _buildItem('assets/icons/dashboard.png', "Dashboard", () {},context),
                  _buildItem('assets/icons/profile.png', "My Account", () {},context),
                  _buildItem('assets/icons/payment.png', "Payment", () {},context),
                  _buildItem('assets/icons/booking.png', "My Booking", () {},context),
                  _buildItem('assets/icons/message.png', "Messages", () {},context),
                  _buildItem('assets/icons/heart.png', "Favorites", () {},context),
                  _buildItem('assets/icons/status.png', "Check Status", () {},context),
                  _buildItem('assets/icons/padlock.png', "Change Password", () {},context),
                  _buildItem('assets/icons/logout.png', "Log Out", () {},context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Sidebar Item Builder
  Widget _buildItem(String imagePath, String title, VoidCallback onTap,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: 400,
        child: ListTile(
          leading: Image.asset(imagePath,color: Theme.of(context).primaryColor,scale: 0.8,),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          hoverColor: Colors.blue.withOpacity(0.1),
          onTap: onTap,
        ),
      ),
    );
  }
}
