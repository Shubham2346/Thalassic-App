import 'package:flutter/material.dart';
import 'package:my_app/features/dashboard/dashboard_page.dart';

// Import your pages
import '../features/landing/landing_page.dart';
import '../features/auth/login_page.dart';
import '../features/auth/create_account_page.dart';
// import '../features/home/home_page.dart';
import '../features/courses/courses_page.dart';
import '../features/services/services_page.dart';
import '../features/blog/blog_page.dart';
import '../features/about/about_page.dart';
import '../features/contact/contact_page.dart';
import '../features/profile/profile_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LandingPage(),
  '/login': (context) => LoginPage(),
  '/create-account': (context) => CreateAccountPage(),
  '/dashboard': (context) => DashboardPage(),
  '/courses': (context) => CoursesPage(),
  '/services': (context) => ServicesPage(),
  '/blog': (context) => BlogPage(),
  '/about': (context) => AboutPage(),
  '/contact': (context) => ContactPage(),
  '/profile': (context) => ProfilePage(),
};