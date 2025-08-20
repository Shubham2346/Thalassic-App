import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailSelected = true;
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Background
            Image.asset(
              'assets/ocean_background.png',
              fit: BoxFit.cover,
            ),

            /// Foreground
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  /// Logo
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Image.asset('assets/logo.png'),
                  ),
                  const SizedBox(height: 16),

                  /// Tagline
                  Text(
                    "A Complete Seafarer's Home",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 16),

                  /// Title
                  Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "Join our community",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 32),

                  /// Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Back + title row
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Verify your Account",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// Toggle buttons Email / Phone
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChoiceChip(
                              label: const Text("Email"),
                              selected: isEmailSelected,
                              onSelected: (val) {
                                setState(() {
                                  isEmailSelected = true;
                                });
                              },
                              selectedColor: const Color(0xFF2E7D89),
                              labelStyle: TextStyle(
                                color: isEmailSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(width: 16),
                            ChoiceChip(
                              label: const Text("Phone"),
                              selected: !isEmailSelected,
                              onSelected: (val) {
                                setState(() {
                                  isEmailSelected = false;
                                });
                              },
                              selectedColor: const Color(0xFF2E7D89),
                              labelStyle: TextStyle(
                                color: !isEmailSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        /// Icon + verify text
                        Icon(
                          isEmailSelected
                              ? Icons.email_outlined
                              : Icons.phone_android_outlined,
                          size: 48,
                          color: const Color(0xFF2E7D89),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          isEmailSelected
                              ? "Verify Your email"
                              : "Verify Your phone",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isEmailSelected
                              ? "We’ve sent a 6-digit code to email@placeholder.com"
                              : "We’ve sent a 6-digit code to +91 98765 43210",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black54),
                        ),
                        const SizedBox(height: 24),

                        /// OTP Fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return SizedBox(
                              width: 40,
                              child: TextField(
                                controller: _otpControllers[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                                onChanged: (val) {
                                  if (val.isNotEmpty && index < 5) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),

                        /// Verify button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7D89),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // TODO: Verify OTP
                          },
                          child: const Text("Verify Email"),
                        ),
                        const SizedBox(height: 16),

                        /// Resend text
                        Column(
                          children: [
                            const Text(
                              "Didn’t receive the code?",
                              style: TextStyle(color: Colors.black87),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: resend code logic
                              },
                              child: const Text(
                                "Resend in 45s",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}