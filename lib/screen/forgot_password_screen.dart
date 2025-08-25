import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/style.dart';
import 'login_screen.dart'; // Make sure this import is correct

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 100),
            Text(
              "Reset Password",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: StyleColor.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Enter your email to get a reset link.",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: StyleColor.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: handle sending reset link
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: StyleColor.primary,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                "Send Reset Link",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back to Login",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: StyleColor.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
