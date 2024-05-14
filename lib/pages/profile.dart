import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),

            const Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),

            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/circle_avatar_image.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            const Text(
              "Mr Karimov",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Food tester",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            card(leading: const Icon(Icons.person_outline), text: "Edit Profile", trailing: const Icon(Icons.chevron_right)),
            card(leading: const Icon(Icons.stars_outlined), text: "Renew Plans", trailing: const Icon(Icons.chevron_right)),
            card(leading: const Icon(Icons.settings), text: "Setting", trailing: const Icon(Icons.chevron_right)),
            card(leading: const Icon(Icons.list_alt_rounded), text: "Terms & Privacy Policy", trailing: const Icon(Icons.chevron_right)),
            card(leading: const Icon(Icons.logout), text: "Log Out", trailing: const Icon(Icons.chevron_right)),

          ],
        ),
      ),
    );
  }
}


Widget card({required Icon leading, required String text, required Icon trailing}){
  return  Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Card(
      child: ListTile(
        onTap: (){},
        leading: leading,
        title:  Text(text),
        trailing: trailing,
      ),
    ),
  );
}