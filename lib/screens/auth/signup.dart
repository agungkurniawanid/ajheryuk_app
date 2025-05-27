import 'package:ajheryuk/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = ref.watch(obscurePasswordProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 40),
                          Image.asset(
                            'assets/images/Logo Mark.png',
                            width: 170,
                            fit: BoxFit.contain,
                          ),
                          _buildFullNameField(),
                          const SizedBox(height: 10),
                          _buildEmailField(),
                          const SizedBox(height: 10),
                          _buildPasswordField(ref, obscurePassword),
                          const SizedBox(height: 20),
                          _buildSignUpButton(),
                          const SizedBox(height: 24),
                          _buildOrDivider(),
                          const SizedBox(height: 20),
                          _buildSocialButtons(),
                          const SizedBox(height: 10),
                          _privacyDescription(),
                        ],
                      ),
                      _buildLoginPrompt(context),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFullNameField() {
    return TextField(
      style: GoogleFonts.poppins(),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        labelText: 'Fullname',
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF9D9FA0),
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildEmailField() {
    return TextField(
      style: GoogleFonts.poppins(),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        labelText: 'Email',
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF9D9FA0),
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField(WidgetRef ref, bool obscurePassword) {
    return TextField(
      obscureText: !obscurePassword,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: const Color(0xFF9D9FA0),
          ),
          onPressed: () {
            ref.read(obscurePasswordProvider.notifier).state = !obscurePassword;
          },
        ),
        filled: true,
        hintStyle: GoogleFonts.poppins(color: const Color(0xFF9D9FA0)),
        fillColor: const Color(0xFFF6F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(color: Color(0xFF9D9FA0), fontSize: 16),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEC5F5F),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {},
        child: Text(
          'Sign Up',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Or",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        _buildFacebookButton(),
        const SizedBox(height: 16),
        _buildGoogleButton(),
      ],
    );
  }

  Widget _buildFacebookButton() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0082CD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/media/facebook.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Log in with Facebook',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleButton() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF6F7FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/media/google.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Log in with Google',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _privacyDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF8C8C8C),
          ),
          children: [
            const TextSpan(text: "By signing up you accept the "),
            TextSpan(
              text: "Terms of Service",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0082CD),
              ),
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0082CD),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Text(
              " Log in",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0082CD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
