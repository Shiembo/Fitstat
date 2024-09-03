import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String firstName = user != null ? user.displayName?.split(' ')[0] ?? '' : '';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  // Placeholder for user avatar
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    firstName,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    user?.email ?? '',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SettingsOption(
              icon: Icons.support,
              title: 'TARGENOMETER SUPPORT',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.science,
              title: 'TARGENOMETER LABS',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.transgender,
              title: 'GENDER',
              trailingText: 'MALE',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.fitness_center,
              title: 'EXERCISE LIBRARY',
              trailingText: 'MALE MODEL',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.straighten,
              title: 'UNITS OF MEASURE',
              trailingText: 'KG',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.cake,
              title: 'DATE OF BIRTH',
              trailingText: '8 JUL 1999',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.notifications,
              title: 'NOTIFICATIONS',
              onTap: () {},
            ),
           
            SettingsOption(
              icon: Icons.format_paint,
              title: 'THEME',
              trailingText: 'AUTO',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.gavel,
              title: 'LEGAL',
              onTap: () {},
            ),
            SettingsOption(
              icon: Icons.logout,
              title: 'LOG OUT',
              onTap: () => signOut(context),
            ),
            SettingsOption(
              icon: Icons.delete,
              title: 'DELETE ACCOUNT',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'v2.46.0 (22367)',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final Widget? trailing;
  final VoidCallback onTap;

  const SettingsOption({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: trailing ??
          (trailingText != null
              ? Text(trailingText!, style: const TextStyle(color: Colors.white))
              : const Icon(Icons.arrow_forward_ios, color: Colors.white)),
      onTap: onTap,
    );
  }
}
