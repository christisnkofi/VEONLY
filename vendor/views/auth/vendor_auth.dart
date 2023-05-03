import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:vendor_only/vendor/views/auth/screens/landing_screen.dart';
import 'package:vendor_only/vendor/views/auth/vendor_register_screen.dart';

class VendorAuthScreen extends StatelessWidget {
  const VendorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(providerConfigs: [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(
                clientId: '1:266821751062:android:bf8fb9c742f85eb676c037'),
            PhoneProviderConfiguration(),
          ]);
        }

        return //RegisterScreen();
            //VendorRegistrationScreen();
            LandingScreen();
      },
    );
  }
}
