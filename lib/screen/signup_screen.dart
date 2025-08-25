import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/social_button.dart';
import '../helper/style.dart';
import '../helper/pos_textform_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 80),
              Text(
                "Create Account",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: StyleColor.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              Text(
                "Create an account so you can explore all the existing jobs",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: StyleColor.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email Field
              PosTextformField(
                controller: emailController,
                label: "Email",
                placeholder: "Enter your email",
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required!";
                  }
                  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regex.hasMatch(value)) {
                    return "Enter a valid email!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Phone Number Field
              PosTextformField(
                controller: phoneController,
                label: "Phone Number",
                placeholder: "Enter your phone number",
                prefixIcon: const Icon(Icons.phone),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number is required!";
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Phone number must be numeric!";
                  }
                  if (value.length < 8) {
                    return "Phone number must be at least 8 digits!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password Field
              PosTextformField(
                controller: passwordController,
                label: "Password",
                placeholder: "Enter your password",
                obscureText: isPassword,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required!";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password Field
              PosTextformField(
                controller: confirmPasswordController,
                label: "Confirm Password",
                placeholder: "Re-enter your password",
                obscureText: isConfirmPassword,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPassword = !isConfirmPassword;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password!";
                  }
                  if (value != passwordController.text) {
                    return "Passwords do not match!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Registration successful!"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // ⏳ Delay redirect until snackbar is shown
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleColor.primary,
                  shadowColor: StyleColor.primary.withOpacity(0.25),
                  elevation: 15,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
