import 'package:flutter/material.dart';
import '../../core/widgets/custom_textfield.dart';
import '../../core/widgets/custom_button.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _selectedUserType;

  final List<String> _userTypes = [
    "Seafarer",
    "Trainer",
    "Admin",
  ];

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

                  /// Card with form
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        /// Full name
                        CustomTextField(
                          controller: _fullNameController,
                          hintText: "Full Name",
                          prefixIcon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),

                        /// Email
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email Address",
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),

                        /// Phone
                        CustomTextField(
                          controller: _phoneController,
                          hintText: "Phone Number",
                          prefixIcon: Icons.phone_outlined,
                        ),
                        const SizedBox(height: 16),

                        /// User type dropdown
                        DropdownButtonFormField<String>(
                          initialValue: _selectedUserType,
                          hint: const Text("Select User type"),
                          items: _userTypes
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.group_outlined),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _selectedUserType = val;
                            });
                          },
                        ),
                        const SizedBox(height: 16),

                        /// Password
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        /// Confirm password
                        CustomTextField(
                          controller: _confirmPasswordController,
                          hintText: "Confirm Password",
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscureConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        /// Create Account button
                        CustomButton(
                          text: "Create Account",
                          onPressed: () {
                            // TODO: Handle signup
                          },
                        ),
                        const SizedBox(height: 16),

                        /// Divider
                        Row(
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Or continue with",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// Social buttons inline
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Image.asset('assets/google.png', height: 20),
                                label: const Text("Google"),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Image.asset('assets/facebook.png', height: 20),
                                label: const Text("Facebook"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// Already have an account? Sign In
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushReplacementNamed(context, '/login'),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
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